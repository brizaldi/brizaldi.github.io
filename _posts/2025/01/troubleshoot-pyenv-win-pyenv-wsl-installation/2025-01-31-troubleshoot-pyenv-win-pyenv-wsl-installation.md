---
title: Troubleshoot pyenv-win on Windows & pyenv on WSL installation
date: 2025-01-31 09:11:00 +07:00
tags: [tutorial, windows, linux]
description: Troubleshoot pyenv-win on Windows & pyenv on WSL installation.
---

Update .bashrc / .profile / .bash_profile in WSL
```bash
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
```

With this value:
```bash
export PATH="$PYENV_ROOT/bin:$PATH"
```