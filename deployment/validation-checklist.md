# Validation checklist

Use this checklist before shifting traffic to Green.

## Infrastructure parity

- [ ] Same AMI family used for Blue and Green
- [ ] Same instance type used for Blue and Green
- [ ] Same VPC used for both environments
- [ ] Same subnet model used for both environments
- [ ] Same security-group rules applied to both environments
- [ ] Same IAM instance profile attached where appropriate
- [ ] Same application port configured for both environments
- [ ] Same health-check path configured for both environments

## Networking parity

- [ ] Blue and Green are in compatible subnets
- [ ] Target groups can reach the EC2 instances on port 80
- [ ] ALB listener is reachable from the internet

## Security parity

- [ ] Security group allows HTTP on port 80
- [ ] Security group rules are reviewed for least privilege
- [ ] No secrets are stored in runtime files or screenshots

## Application validation

- [ ] Green page renders correctly
- [ ] Health endpoint returns a healthy response
- [ ] HTTP 200 is returned for the Green application
- [ ] Logs are checked for startup and runtime issues

## Target-group health

- [ ] Green target status is healthy
- [ ] Blue target status remains healthy
- [ ] No unexpected 4xx or 5xx errors are observed

## Smoke testing

- [ ] Smoke test succeeds for Blue
- [ ] Smoke test succeeds for Green
- [ ] Health endpoint check passes for both environments

## Monitoring readiness

- [ ] CloudWatch metrics are visible for the ALB and EC2 instances
- [ ] CloudWatch alarms are created and visible
- [ ] SNS subscription is confirmed
- [ ] Rollback route is confirmed before traffic switching

## Approval before traffic switch

- [ ] Blue remains running during validation
- [ ] No critical errors are observed in the application logs
- [ ] The team agrees that Green is ready for a limited traffic shift

## Related documents

- [README.md](../README.md)
- [deployment/traffic-switch-guide.md](traffic-switch-guide.md)
