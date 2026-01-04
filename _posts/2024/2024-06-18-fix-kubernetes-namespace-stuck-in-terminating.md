---
title: Fix Kubernetes namespace stuck in Terminating status
date: 2024-06-18 10:26:00 +07:00
tags: [tutorial, devops, kubernetes]
categories: [Tutorial, Kubernetes]
---

Run using kubectl
```bash
kubectl patch ns <NAMESPACE_TO_BE_DELETED> -p '{"metadata":{"finalizers":null}}'
```

> Some resources are remaining: ingresses.extensions has 1 resource instances, ingresses.networking.k8s.io has 1 resource instances
> Some content in the namespace has finalizers remaining: ingress.k8s.aws/resources in 2 resource instances

If you got the error above, that means you still have resources left in your namespace, in this case, an ingress. You must delete the remaining resources first before the namespace can be deleted.

To patch the ingress:

```bash
kubectl patch ingress <INGRESS_NAME> -n <NAMESPACE> -p '{"metadata":{"finalizers":[]}}' --type=merge
```
