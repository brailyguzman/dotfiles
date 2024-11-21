from datetime import datetime

today = datetime.now()

date_str = today.strftime("%Y-%m-%d")
month_str = today.strftime("%m-%B")
year_str = today.strftime("%Y")

template = f"""\
# Journal for {date_str}

## Intention

My focus for today is:

## Gratitude

Today, I'm grateful for:

-
-
-

## Declaration

Today, I will get 1% better by:

## Journal Entry

-

## Top 3 Priorities

1.
2.
3.

## Tasks

-   [ ]
-   [ ]
-   [ ]

## Reflections

-   What went well:
-   What could be improved:

"""
