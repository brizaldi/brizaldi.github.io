---
title: Quickest method to install Docker on Linux
date: 2023-11-17 17:27:00 +07:00
# modified: 2023-11-16 10:49:00 +07:00
tags: [tutorial, devops, docker, linux]
description: Quickest method to install Docker on Linux.
---

Download installation script
```bash
$ curl -fsSL https://get.docker.com -o install-docker.sh
```

Run the script as root
```bash
$ sudo sh install-docker.sh
```

Add current user to `docker` user group
```bash
$ sudo usermod -a -G docker <user>
# Example:
$ sudo usermod -a -G docker john
```

Re-login into the machine to apply changes

Check if docker successfully installed
```bash
$ docker --version
$ docker ps
```