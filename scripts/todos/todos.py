import os
from constants import *


def main():
    if not os.path.exists(file_path):
        with open(file_path, "w") as todos:
            todos.write(template)
            todos.close()
    os.system(f"nvim {file_path}")


if __name__ == "__main__":
    main()
