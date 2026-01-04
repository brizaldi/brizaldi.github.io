---
title: Create a Database Tunnel from Kubernetes
date: 2026-01-03 10:25:00 +07:00
tags: [tutorial, kubernetes, database]
categories: [Tutorial, Kubernetes]
---

1. Run this command to create a tunnel, ensure that you’re currently connected to the right Kubernetes cluster:
```bash
kubectl -n default run <POD_NAME> -it --image=alpine/socat --tty --rm --expose=true --port=<DB_PORT> tcp-listen:<DB_PORT>,fork,reuseaddr tcp-connect:<DB_HOST>:<DB_PORT>
```
Example:
```bash
kubectl -n default run my-db-tunnel -it --image=alpine/socat --tty --rm --expose=true --port=5432 tcp-listen:5432,fork,reuseaddr tcp-connect:mydb.xxx.ap-southeast-1.rds.amazonaws.com:5432
```

1. Ensure that the pod and service for the tunnel are running.
2. Create a port forward from your local machine to the tunnel service:
```bash
kubectl port-forward service/<SERVICE_NAME> <LOCAL_PORT>:<REMOTE_PORT>
```
Example:
```bash
kubectl port-forward service/my-db-tunnel 5432:5432
```

1. You should now be able to connect to the database using localhost as the URL host.

> Don't forget to terminate all connections when you're done, and ensure that all resources created, such as pods and services, are deleted from the cluster.
{: .prompt-warning }
