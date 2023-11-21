---
title: Install golang-migrate on Ubuntu 22.04
date: 2023-11-21 09:34:00 +07:00
tags: [tutorial, golang, linux]
description: Install golang-migrate on Ubuntu 22.04.
---

Install from release file directly
```bash
$ wget http://github.com/golang-migrate/migrate/releases/latest/download/migrate.linux-amd64.deb
$ sudo dpkg -i migrate.linux-amd64.deb
```

Check installed version
```bash
$ migrate --version
```

##### Resources

- [Related issue](https://github.com/golang-migrate/migrate/issues/818)
