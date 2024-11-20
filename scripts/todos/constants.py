import os

file_dir = os.path.expanduser("~/SecondBrain")
file_path = os.path.join(file_dir, "todos.md")

template = """\
# To-Dos

## Today

-   [ ] Task 1
-   [ ] Task 2

## This Week

-   [ ] Weekly goal 1
-   [ ] Weekly goal 2

## Backlog

-   [ ] Future task 1
-   [ ] Future task 2

"""
