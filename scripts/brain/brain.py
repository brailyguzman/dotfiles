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
    print("Enter category (e.g. Programming)")
    category = input(f"{GRN}> {RESET}").strip()
    category = category[0].upper() + category[1:].lower()

    print("Enter topic hierarchy (e.g. Libraries/React)")
    topic_hierarchy = input(f"{GRN}> {RESET}").strip()
    topic_hierarchy = topic_hierarchy[0].upper() + topic_hierarchy[1:].lower()

    title = input(f"Enter title: ").strip()
    title = " ".join(word.capitalize() for word in title.split())

    note_dir = BASE_DIR / "Notes" / category / topic_hierarchy
    note_dir.mkdir(parents=True, exist_ok=True)

    existing_files = [f for f in note_dir.glob("*.md")]

    note_counter = len(existing_files) + 1
    file_name = f"{str(note_counter).zfill(2)}-{title.replace(' ', '_').lower()}.md"

    note_file = note_dir / file_name

    if not note_file.exists():
        with open(note_file, "w") as f:
            f.write(
                create_note_template(
                    title,
                    category,
                    topic_hierarchy,
                    datetime.now().strftime("%Y-%m-%d"),
                )
            )

    os.system(f"nvim {note_file}")


def open_goals():
    goals_path = JOURNAL_DIR / "goals.md"

    if not goals_path.exists():
        goals_path.write_text(create_goals_template(date, year))

    os.system(f"nvim {goals_path}")
