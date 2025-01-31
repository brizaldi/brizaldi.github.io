---
title: Install specific version of APT package
date: 2025-01-20 13:23:00 +07:00
tags: [tutorial, linux]
description: Install specific version of APT package.
---

List available version:
```bash
apt list -a <PACKAGE_NAME>
```

Install specific version:
```bash
apt install <PACKAGE_NAME>=<PACKAGE_VERSION>
```

For example:
```bash
apt install terraform=1.10.4-1
```