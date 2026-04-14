---
title: "Fix PostgreSQL Query Errors: Canceling Statement Due to Conflict with Recovery"
date: 2026-04-14 09:40:00 +07:00
tags: [tutorial, database, postgresql]
categories: [Tutorial, Database, PostgreSQL]
---
During database query operations, you may encounter the following error:
```
canceling statement due to conflict with recovery
```

This issue typically occurs when a query running on a standby (read replica) conflicts with the recovery process (e.g., WAL replay). As a result, the query gets canceled before completion.

### Root Cause

The error happens because PostgreSQL enforces limits on how long queries can delay the recovery process on standby instances. These limits are controlled by the following parameters:

- `max_standby_archive_delay`
- `max_standby_streaming_delay`

If a query exceeds the allowed delay, PostgreSQL cancels it to allow recovery to proceed.

### Solution

To prevent query failures due to this conflict, you need to increase the values of the parameters above in the **parameter group**.

#### Parameters to Update

- `max_standby_archive_delay`
- `max_standby_streaming_delay`

#### Configuration Guidelines

Set both parameters to a value **greater than the time required to complete the query process**.

#### Example

- If the query process takes **13 minutes**, configure the delay to at least **15 minutes**.

#### Unit Conversion

Both parameters use **milliseconds (ms)**.

- 15 minutes = **900,000 ms**

#### Final Configuration Example
```
max_standby_archive_delay = 900000
max_standby_streaming_delay = 900000
```

### Best Practices

- Always monitor the average query duration before setting these values.
- Add a buffer (e.g., +2–5 minutes) to avoid unexpected cancellations.
- Avoid setting excessively high values, as this may delay recovery and replication.