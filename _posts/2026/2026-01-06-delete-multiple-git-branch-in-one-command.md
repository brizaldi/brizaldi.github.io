---
title: Delete Multiple Git Branch in One Command
date: 2026-01-06 13:59:00 +07:00
tags: [tutorial, git]
categories: [Tutorial, Git]
---

```bash
git branch -D `git branch | grep -E '<PATTERN>'`
```