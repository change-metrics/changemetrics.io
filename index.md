---
title: Welcome
---

We are working on improving the developer experience. Check out [Monocle](https://github.com/change-metrics/monocle#readme).

The main idea behind Monocle is to detect anomalies in the way changes
are produced in your project on GitHub and Gerrit.

Each team is unique in its way of working: how to do code reviews, how
many reviewers, how to do CI, is self merge allowed...

So the philosophy behind Monocle is to let you visualize and explore
metrics and data that are relevant to the way you work by navigating
and filtering in the web user interface.

For example, your team may want to know:

- what is the ratio of created changes vs merged changes?
- is there a good balance between change creations and change reviews?
- what is the ratio of abandoned changes?
- what are the collaboration patterns between the team members?
- how long does it take to merge a change?
- average delay for the first comment or review?
- long standing changes?
- do we have new contributors?

Here is a graph representing what has been going on during a period of time:

<img alt="Main Stats Graph" src="https://user-images.githubusercontent.com/529708/80858201-0c530700-8c58-11ea-867c-9b1b4568b781.png" class=main />

Here is the graph of collaboration patterns:

<img alt="Collaboration Graph" src="https://user-images.githubusercontent.com/529708/80858244-79ff3300-8c58-11ea-8caa-b3e72f5d9c88.png" class=main />

Here is the graph of the complexity versus time to merge changes:

<img alt="Complexity Graph" src="https://user-images.githubusercontent.com/529708/80858379-45d84200-8c59-11ea-854e-9548be7968ff.png" class=main />

# Recent Posts

$partial("templates/post-list.html")$
