import os
from datetime import datetime
from pathlib import Path
from colors import *

from templates import *

BASE_DIR = Path.home() / "Documents/SecondBrain"
JOURNAL_DIR = BASE_DIR / "Journal" / str(datetime.now().year)
date = datetime.now().strftime("%Y-%m-%d")
month = datetime.now().strftime("%m")
year = datetime.now().strftime("%Y")


def daily_journal():
    journal_month_dir = JOURNAL_DIR / month
    journal_file = journal_month_dir / f"{datetime.now().strftime('%Y-%m-%d')}.md"

    journal_month_dir.mkdir(parents=True, exist_ok=True)

    if not journal_file.exists():
        journal_file.write_text(create_journal_template(date))

    os.system(f"nvim {journal_file}")


def create_note():
    try:
        print("Enter category (e.g. Programming/JavaScript)")
        category_hierarchy = input(f"{GRN}> {RESET}").strip()
        category_hierarchy = "/".join(
            category.title().replace(" ", "-")
            for category in category_hierarchy.split("/")
        )

        print("Enter topic hierarchy (e.g. Libraries/React)")
        topic_hierarchy = input(f"{GRN}> {RESET}").strip()
        topic_hierarchy = "/".join(
            topic.title().replace(" ", "-") for topic in topic_hierarchy.split("/")
        )

        title = input(f"Enter title: ").strip()
        title_formatted = " ".join(word.capitalize() for word in title.split())
        file_name = f"{len(list((BASE_DIR / 'Notes' / category_hierarchy / topic_hierarchy).glob('**/*.md')))+1:02d}-{title.replace(' ', '-').lower()}.md"

        note_dir = BASE_DIR / "Notes" / category_hierarchy / topic_hierarchy
        note_dir.mkdir(parents=True, exist_ok=True)

        note_file = note_dir / file_name

        if note_file.exists():
            print(f"{RED}Error: Note with this filename already exists!{RESET}")
            return

        with open(note_file, "w") as f:
            f.write(
                create_note_template(
                    title_formatted,
                    category_hierarchy,
                    topic_hierarchy,
                    datetime.now().strftime("%Y-%m-%d"),
                )
            )

        print(f"{GRN}Note created at: {note_file}{RESET}")
        os.system(f"nvim {note_file}")

    except Exception as e:
        print(f"{RED}Error creating note: {e}{RESET}")


def open_goals():
    goals_path = JOURNAL_DIR / "goals.md"

    if not goals_path.exists():
        goals_path.write_text(create_goals_template(date, year))

    os.system(f"nvim {goals_path}")


def create_project():
    print("Enter Project Name (e.g. Listy)")
    project_name = input(f"{GRN}> {RESET}").strip().capitalize()

    print("Enter Project Type (e.g. Fullstack)")
    project_type = input(f"{GRN}> {RESET}").strip().replace("-", "").capitalize()

    if len(project_type) <= 3:
        project_type = project_type.upper()

    project_dir = BASE_DIR / "Projects" / project_type / project_name
    project_dir.mkdir(parents=True, exist_ok=True)

    create_project_template(project_name, project_type, date)

    # TODO: Create files


def find_note():
    try:
        find_command = (
            f"find {BASE_DIR} -type f -name '*.md' " f"| sed 's|{BASE_DIR}/||' | fzf"
        )
        note_path = os.popen(find_command).read().strip()

        if note_path:
            os.system(f"nvim { BASE_DIR / note_path}")
        else:
            print(f"{RED}No note selected.{RESET}")
    except Exception as e:
        print(f"{RED}Error using fzf: {e}{RESET}")
