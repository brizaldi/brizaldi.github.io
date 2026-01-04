---
title: Properly Encode base64 Value to Use in Kubernetes Secret
date: 2026-01-04 19:08:00 +07:00
tags: [tutorial, kubernetes]
categories: [Tutorial, Kubernetes]
---

This command tested on Linux:
```bash
echo -n "<TEXT>" | base64 -w 0
```

From file:
```bash
echo -n "$(cat <FILE_PATH>)" | base64 -w 0
```
