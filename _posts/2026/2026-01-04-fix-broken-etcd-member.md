---
title: Fix Broken etcd Member in Kubernetes Cluster
date: 2026-01-04 08:18:00 +07:00
tags: [tutorial, kubernetes]
categories: [Tutorial, Kubernetes]
---

## Option 1:

1. Delete PV & PVC of the broken member. Alternatively you can remove everything inside /bitnami/etcd/data/ directory inside the volume. If you do this, then no need to delete PVC.
2. Remove broken member from the etcd cluster (use command below).
3. Delete pod of the broken member.
4. The pod will restart and automatically join the existing cluster.
5. If it still doesn’t work, try option 2 below.

## Option 2:

1. Enter the shell of a running etcd pod. For example, if etcd-1 is going to be replaced, then shell into etcd-0 or etcd-2.
2. Check the member ID of the etcd instance you want to replace.
```bash
etcdctl member list -w table
```
3. Delete etcd member.
```bash
etcdctl member remove <member_id> --user root --password <password>
```
4. Delete failed etcd pod.

## Useful Commands

List member:
```bash
etcdctl -w table member list
```

Remove member:
```bash
etcdctl member remove <MEMBER_ID> --user="root" --password="<ETCD_PASSWORD>"
```

Add member:
```bash
etcdctl member add <MEMBER_NAME> --peer-urls="<URL>:2380" --user="root" --password="<ETCD_PASSWORD>"
```

Example:
```bash
etcdctl member add etcd-2 --peer-urls="http://etcd-2.etcd-headless.apisix.svc.cluster.local:2380" --user="root" --password="<ETCD_PASSWORD>"
```
