import os

from constants import *


def main():
    base_dir = os.path.expanduser("~/SecondBrain/01-Journals")
    journal_dir = os.path.join(base_dir, year_str, month_str)
    journal_file = os.path.join(journal_dir, f"{date_str}.md")

    os.makedirs(journal_dir, exist_ok=True)

    if not os.path.exists(journal_file):

        with open(journal_file, "w") as f:
            f.write(template)

    os.system(f"nvim {journal_file}")


if __name__ == "__main__":
    main()
