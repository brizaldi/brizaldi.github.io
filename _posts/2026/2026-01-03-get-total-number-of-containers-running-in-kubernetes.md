---
title: Get Total Number of Containers Running in Kubernetes
date: 2026-01-03 10:23:00 +07:00
tags: [tutorial, kubernetes]
categories: [Tutorial, Kubernetes]
---

```bash
kubectl get pods -A -o jsonpath="{..containers[*].name}" | wc -w
```
