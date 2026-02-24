---
title: Fix Docker Pull Rate Limit in Kubernetes
date: 2026-02-24 11:24:00 +07:00
tags: [tutorial, kubernetes]
categories: [Tutorial, Kubernetes]
---

```bash
DOCKER_REGISTRY_SERVER="https://index.docker.io/v1/"
DOCKER_USER="xxx"
DOCKER_PASSWORD="xxx"
DOCKER_EMAIL="xxx"
SECRET_NAME="xxx"
NAMESPACES=$(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}')

for NS in $NAMESPACES; do
  echo "Processing namespace: $NS"
  if ! kubectl get serviceaccount default --namespace=$NS -o jsonpath='{.imagePullSecrets[*].name}' | grep -qw $SECRET_NAME; then
    kubectl create secret docker-registry $SECRET_NAME \
      --namespace=$NS \
      --docker-server=$DOCKER_REGISTRY_SERVER \
      --docker-username=$DOCKER_USER \
      --docker-password=$DOCKER_PASSWORD \
      --docker-email=$DOCKER_EMAIL
    
    if kubectl get serviceaccount default --namespace=$NS -o jsonpath='{.imagePullSecrets}' | grep -q .; then
      # imagePullSecrets exists → append
      kubectl patch serviceaccount default --namespace=$NS --type='json' \
        -p='[{"op":"add","path":"/imagePullSecrets/-","value":{"name":"'$SECRET_NAME'"}}]'
    else
      # imagePullSecrets does not exist → create array
      kubectl patch serviceaccount default --namespace=$NS \
        -p='{"imagePullSecrets":[{"name":"'$SECRET_NAME'"}]}'
    fi
  fi
done
```