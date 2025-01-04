from brain import *
from colors import *

options = [
    {"command": "o", "text": f"(o) - Open Brain"},
    {"command": "j", "text": f"(j) - Open Journal"},
    {"command": "g", "text": f"(g) - Open Goals"},
    {"command": "q", "text": f"(q) - Quit"},
]


def main():
    max_length = 0

    for option in options:
        length = len(option["text"])

        if length > max_length:
            max_length = length

        print(f"{CYN}{option["text"]}{RESET}")

    print("-" * max_length)

    option = input(f"{GRN}[?]: {RESET}").strip()
    if option == "o":
        os.system(f"nvim {BASE_DIR}")
    elif option == "j":
        daily_journal()
    elif option == "n":
        create_note()
    elif option == "g":
        open_goals()
    elif option == "q":
        exit()


if __name__ == "__main__":
    main()
