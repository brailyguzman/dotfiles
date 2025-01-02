from brain import *
from colors import *


def main():
    print(f"{GRN}{BOLD}Brain Manager{RESET}")
    print(f"{CYN}0.{RESET} Open Notes")
    print(f"{CYN}1.{RESET} Create Daily Journal")
    print(f"{CYN}2.{RESET} Create Atomic Note")

    option = input(f"{GRN}[+]: {RESET}").strip()
    if option == "0":
        os.system(f"nvim {BASE_DIR}")
    elif option == "1":
        daily_journal()
    elif option == "2":
        create_note()
    else:
        exit()


if __name__ == "__main__":
    main()
