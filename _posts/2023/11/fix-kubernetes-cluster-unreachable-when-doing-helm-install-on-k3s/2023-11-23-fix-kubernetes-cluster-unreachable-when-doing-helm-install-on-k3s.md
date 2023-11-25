---
title: Fix Kubernetes cluster unreachable when doing Helm install on K3s
date: 2023-11-23 08:56:00 +07:00
tags: [tutorial, devops, kubernetes, linux]
description: Fix Kubernetes cluster unreachable when doing Helm install on K3s.
---

Configure KUBECONFIG
```bash
$ export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```