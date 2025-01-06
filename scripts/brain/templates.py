def create_journal_template(date: str):
    return f"""---
title: Journal for {date}
tags: [journal, daily]
date: {date}
---

# Journal for {date}

## Intention

My focus for today is to

## Gratitude

Today, I'm grateful for:

-
-
-

## Declaration

Today, I will get 1% better by

## Journal Entry

-

## Top 3 Priorities

1.
2.
3.

## Tasks

- [ ]
- [ ]
- [ ]

## Reflections

- What went well:
- What could be improved:
    """


def create_note_template(
    title: str, category_hierarchy: str, topic_hierarchy: str, date: str
):
    tags = []

    category_arr = category_hierarchy.lower().split("/")

    for category in category_arr:
        tags.append(f"#{category.lower()}")

    topic_arr = topic_hierarchy.split("/")

    for topic in topic_arr:
        tags.append(f"#{topic.lower()}")

    return f"""---
title: {title}
date: {date}
category: {category_hierarchy}
topic: {topic}
tags: [{', '.join(tags)}]
related_notes: []
---

# {title}

"""


def create_goals_template(date: str, year: str):
    return f"""---
title: Goals for {year}
date: {date}
tags: [goals, yearly]
---

# Yearly Goals - {year}

## Vision for the Year

- _Write a brief vision statement about what you want to achieve overall this
  year._

## Key Areas of Focus

- **Personal Growth**:
  - _Examples: Read 12 books, learn a new language, improve time management._
- **Career/Professional**:
  - _Examples: Get a promotion, learn a new skill, contribute to open-source
    projects._
- **Health & Wellness**:
  - _Examples: Run a marathon, practice mindfulness, maintain a balanced diet._
- **Relationships**:
  - _Examples: Spend more time with family, build new connections, improve
    communication skills._
- **Finance**:
  - _Examples: Save 20% of income, invest in stocks, create a budget._
- **Hobbies & Creativity**:
  - _Examples: Start a blog, learn to paint, pick up a musical instrument._

## Top 5 Goals for the Year

1. [ ] _Write your first goal here._
2. [ ] _Write your second goal here._
3. [ ] _Write your third goal here._
4. [ ] _Write your fourth goal here._
5. [ ] _Write your fifth goal here._

## Monthly Milestones

- **January**:
  - Milestones: _Write your key milestones for January._
  - Key actions: _List actions needed to achieve these milestones._
- **February**:
  - Milestones:
  - Key actions:
- **March**:
  - Milestones:
  - Key actions:
- _...repeat for all months..._

## Resources and Support

- _List books, courses, tools, or individuals who can support your journey._

## Potential Challenges

- _Identify obstacles that might hinder progress._
- _Describe strategies to overcome these challenges._

## Metrics for Success

- _How will you measure progress? Define clear metrics (e.g., save $500 monthly,
  complete a certification)._

## Reflection

- **Mid-Year Review**:
  - _What progress have you made so far? What needs adjustment?_
- **End-of-Year Review**:
  - _What did you achieve? What lessons did you learn?_
  - _What will you carry into next year?_
"""


def create_project_template(project_name: str, project_type: str, date: str):
    tags = ["#project", f"#{project_type}"]

    return f"""---
title: {project_name} Project
date: {date}
type: {project_type}
tags: [{', '.join(tags)}]

# {project_name} Project
"""
