from brain import *
from colors import *


def main():
    SPACE = "  "

    print(f"{GRN}{BOLD}Brain Manager{RESET}")
    print(f"{SPACE}{CYN}0){RESET} Open Notes")
    print(f"{SPACE}{CYN}1){RESET} Create Daily Journal")
    print(f"{SPACE}{CYN}2){RESET} Create Atomic Note")
    print(f"{SPACE}{RED}q){RESET} Quit")

    option = input(f"{GRN}> {RESET}").strip()
    if option == "0":
        os.system(f"nvim {BASE_DIR}")
    elif option == "1":
        daily_journal()
    elif option == "2":
        create_note()
    elif option == "q":
        exit()


if __name__ == "__main__":
    main()
