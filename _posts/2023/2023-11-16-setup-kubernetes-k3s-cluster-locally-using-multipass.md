---
title: Setup Kubernetes K3s cluster locally using Multipass
date: 2023-11-16 10:49:00 +07:00
# modified: 2023-11-16 10:49:00 +07:00
tags: [tutorial, devops, kubernetes, linux]
categories: [Tutorial, Kubernetes]
# description: Setup Kubernetes K3s cluster locally using Multipass.
---

Create instances
```bash
multipass launch -n master -m 2G
multipass launch -n node1
multipass launch -n node2
```

Open shell on running master instance
```bash
multipass shell master
```

Setup K3s on master instance
```bash
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode=644
```

Get master node token
```bash
sudo cat /var/lib/rancher/k3s/server/node-token
```

Get master instance IP address
```bash
multipass info master
```

```
Name:           master
State:          Running
IPv4:           172.29.200.132 # Use this IP for the next step
                10.42.0.0
                10.42.0.1
Release:        Ubuntu 22.04.3 LTS
Image hash:     054db2d88c45 (Ubuntu 22.04 LTS)
CPU(s):         1
Load:           0.04 0.03 0.01
Disk usage:     4.2GiB out of 4.8GiB
Memory usage:   749.7MiB out of 1.9GiB
Mounts:         --
```

Setup K3s on node instance
```bash
curl -sfL https://get.k3s.io | K3S_URL=https://<master_ip>:6443 K3S_TOKEN=<node_token> sh -
# Example:
curl -sfL https://get.k3s.io | K3S_URL=https://172.29.200.132:6443 \
  K3S_TOKEN=K106b70f0f7032a2c3582a8ea6b1da6149e4402f32fe28e4bfacaf171b747792b81::server:a91678eecb164d40cb5e0d51c9b22be7 sh -
```

Check nodes availability
```bash
kubectl get nodes
```

Bonus: delete instances
```bash
multipass stop master node1 node2
multipass delete master node1 node2
multipass purge
```

## References

- [Multipass installation](https://multipass.run/install)
- [K3s quick-start guide](https://docs.k3s.io/quick-start)
