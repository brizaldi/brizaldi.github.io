---
title: Get Public Key from AWS KMS in PEM Format
date: 2026-02-06 11:33:00 +07:00
tags: [tutorial, aws]
categories: [Tutorial, AWS]
---

```bash
aws kms get-public-key
  \ --key-id <KEY_ID/KEY_ARN>
  \ --query PublicKey
  \ --output text | base64 --decode | openssl pkey -pubin -inform DER
```