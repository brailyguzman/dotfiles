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


def create_note_template(title: str, category: str, topic: str, date: str):
    tags = [f"#{category.lower()}", f"#{topic.lower()}"]

    return f"""---
title: {title}
date: {date}
category: {category}
topic: {topic}
tags: {', '.join(tags)}
related_notes: []
---

# {title}

## Summary:

- [ ] Write a brief summary of the key points covered in this note. What is the main takeaway?

## Main Content:

- [ ] Start expanding the details of this note. Include explanations, examples, and any other relevant information here.

## Tags:

- [ ] Add any additional tags relevant to the content of this note (e.g., #algorithm, #sorting). Tags help with easy categorization and discovery.

## Related Notes:

- [ ] Link to any other related notes. Example: [Algorithms](Algorithms.md)

## Reflections:

- [ ] Write any reflections or ideas for future work related to this note. How does it connect with your other ideas or notes?
"""
