---
title: Generate a New Chaos Mesh Token in Kubernetes
date: 2026-01-19 10:51:00 +07:00
tags: [tutorial, kubernetes]
categories: [Tutorial, Kubernetes]
---

# Temporary / Short-Lived Token

1. Check the existing service account name, the format is usually account-<namespace>-manager-<random_string>.

```bash
kubectl get serviceaccounts -n <NAMESPACE>
```

Sample service account name: `account-my-namespace-manager-abcde

2. Create a new token using the service account above.

```bash
kubectl create token <service_account_name> -n <NAMESPACE>
```
Sample command:

```bash
kubectl create token account-my-namespace-manager-abcde -n my-namespace
```

3. Login to Chaos Mesh using the token and use the service account name above as the name.

# Permanent Token

1. Apply this yaml file using kubectl.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: <SERVICE_ACCOUNT_NAME>-token
  namespace: <NAMESPACE>
  annotations:
    kubernetes.io/service-account.name: <SERVICE_ACCOUNT_NAME>
type: kubernetes.io/service-account-token
```
2. Fetch the token.

```bash
kubectl get secrets -n <NAMESPACE> <SECRET_NAME> --template={{.data.token}} | base64 -d
```

Sample command:

```bash
kubectl get secrets -n my-namespace account-my-namespace-manager-abcde-token --template={{.data.token}} | base64 -d
```
