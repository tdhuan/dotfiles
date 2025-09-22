---
description: Create a git commit with automated staging and message generation
---

Create a git commit by analyzing staged and unstaged changes, then generate an appropriate commit message. If a custom message is provided as an argument, use that instead.
When suggesting commit messages, use git log -n 100 --oneline to review the most recent commit messages for inspiration on format and style
Do NOT add Claude co-authorship footer to commits

Git commit with message: $ARGUMENTS
