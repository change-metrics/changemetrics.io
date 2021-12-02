---
title: Welcome
---

Monocle helps teams and individual to better organize daily duties and
to detect anomalies in the way changes are produced and reviewed.

To achieve this Monocle provides:

- Configurable boards to display changes by criteria
- Analytics on changes
- A simple and powerful query language

However each team is unique in its way of working: how to do code reviews, how
many reviewers, is self merge allowed... The philosophy behind
Monocle is to let you visualize and explore metrics and data that are relevant
to the way you work by navigating and filtering in the web user interface.

For example, you may want to know:

- What is the ratio of created changes vs merged changes?
- Is there a good balance between change creations and change reviews?
- What is the ratio of abandoned changes?
- What are the collaboration patterns between the team members?
- How long does it take to merge a change?
- What is the average delay for the first comment or review?
- What are the long standing changes?
- Who are the new contributors?

Monocle supports Gerrit, GitHub, GitLab.

# Some screenshot of the web UI

The activity view:

<img src="https://raw.githubusercontent.com/change-metrics/monocle/assets/images/monocle-1.3.0/monocle-activity.png" width="100%" height="100%" />

The developer board:

<img src="https://raw.githubusercontent.com/change-metrics/monocle/assets/images/monocle-1.3.0/monocle-board.png" width="100%" height="100%" />

Here is the graph of collaboration patterns:

<img src="https://raw.githubusercontent.com/change-metrics/monocle/assets/images/monocle-1.3.0/monocle-peers-strength.png" width="100%" height="100%" />

# Recent Posts

$partial("templates/post-list.html")$
