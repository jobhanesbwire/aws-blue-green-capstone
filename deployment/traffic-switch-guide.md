# Traffic switch guide

This guide outlines how to switch traffic from Blue to Green in the AWS Management Console.

## Console path

EC2
→ Load Balancers
→ bluegreen-alb
→ Listeners and rules
→ HTTP:80
→ Manage rules
→ Edit forwarding action

## Weighted routing values

Assign the following weights to the target groups:

- blue-target-group
- green-target-group

| Stage | Blue weight | Green weight |
| --- | ---: | ---: |
| Initial production | 100% | 0% |
| Canary validation | 90% | 10% |
| Expanded validation | 50% | 50% |
| Full Green deployment | 0% | 100% |
| Rollback | 100% | 0% |

## What to monitor during each stage

| Stage | What to monitor | Recommended observation period | Decision to proceed | Rollback trigger |
| --- | --- | --- | --- | --- |
| 100/0 | Blue health and baseline behavior | 5–10 minutes | Continue with validation | Any unexpected production issue |
| 90/10 | Target health, 5xx errors, latency | 10–15 minutes | Continue if stable | Elevated errors or unhealthy targets |
| 50/50 | Response time, request count, alarms | 15–20 minutes | Continue if stable | Significant user-facing impact |
| 0/100 | Green health, logs, metrics | 20+ minutes | Promote if stable | Any sustained abnormality |

## Notes

The design is intended to minimize interruption when targets are healthy and the ALB configuration is correct. It does not guarantee absolute zero downtime. The rollback plan should be ready before the first shift.

## Related documents

- [README.md](../README.md)
- [deployment/rollback-plan.md](rollback-plan.md)
