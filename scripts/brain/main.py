from brain import *
from colors import *

options = [
    {"command": "o", "text": "Open Brain"},
    {"command": "j", "text": "Open Journal"},
    {"command": "g", "text": "Open Goals"},
    {"command": "n", "text": "Create Note"},
    {"command": "p", "text": "Create Project (Uncompleted)"},
    {"command": "f", "text": "Find Note"},
    {"command": "q", "text": "Quit"},
]


def display_menu():
    max_length = max(len(option["text"]) for option in options)
    print(f"{GRN}{BOLD}Brain Manager{RESET}")

    print("-" * (max_length + 6))

    for option in options:
        print(f"{CYN}({option['command']}){RESET} - {option['text']}")

    print("-" * (max_length + 6))


def main():
    while True:
        display_menu()

        try:
            choice = input(f"{GRN}[?]: {RESET}").strip().lower()
        except KeyboardInterrupt:
            exit()

        if choice == "o":
            os.system(f"nvim {BASE_DIR}")
        elif choice == "j":
            daily_journal()
        elif choice == "g":
            open_goals()
        elif choice == "n":
            create_note()
        elif choice == "p":
            create_project()
        elif choice == "f":
            find_note()
        elif choice == "q":
            exit()
        else:
            print(f"{RED}Invalid option. Please try again.{RESET}")


if __name__ == "__main__":
    main()
