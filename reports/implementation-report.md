# Implementation report

## Executive summary

This capstone documents a blue/green deployment strategy for a web application in eu-west-1. The design keeps the current production environment on Blue while validating a candidate release on Green before traffic is shifted.

## Scenario

The project represents a Nairobi-based telecommunications provider serving customers across Kenya. The business requirement is to release new functionality with minimal customer impact while maintaining a clear rollback path.

## Scope

The scope includes the web-tier deployment pattern, ALB routing, health checks, monitoring, SNS notifications, and rollback documentation.

## Region

- AWS Region: Europe (Ireland)
- Region code: eu-west-1

## Architecture design

The architecture uses an Internet-facing Application Load Balancer, separate Blue and Green target groups, and EC2 instances representing Version 1 and Version 2.

## Resources implemented

- Blue EC2 instance: blue-server
- Green EC2 instance: green-server
- ALB: bluegreen-alb
- Blue target group: blue-target-group
- Green target group: green-target-group
- Security group: bluegreen-web-sg

## Implementation sequence

1. Deploy the Blue environment as current production.
2. Deploy the Green environment as the candidate release.
3. Validate Green using health checks and smoke tests.
4. Shift traffic gradually from Blue to Green.
5. Monitor CloudWatch metrics and SNS alerts.
6. Roll back to Blue if required.

## Environment parity

Environment parity is an important requirement before switching production traffic. The Green environment should mirror the Blue environment as closely as possible.

## Validation approach

Validation should include smoke tests, target-group health checks, ALB traffic observation, and CloudWatch review.

## Traffic switching

Traffic switching should be performed gradually, with monitoring at each stage. The route weights can move from 100/0 to 90/10, then 50/50, and ultimately 0/100.

## Monitoring

CloudWatch and SNS are used to monitor the environment and notify the team about alarms during deployment.

## Rollback

The rollback process should return traffic to Blue immediately if the deployment causes unacceptable risk.

## Security

Security-review steps should include least-privilege rules, no secret exposure, and controlled access to the web tier.

## Risks and mitigations

- Risk: Green fails validation.
  - Mitigation: Keep Blue active and rollback quickly.
- Risk: Health checks fail.
  - Mitigation: Avoid cutover until healthy targets are confirmed.
- Risk: Monitoring gaps.
  - Mitigation: Configure CloudWatch alarms and SNS notifications.

## Cleanup

Cleanup should happen only after the deployment has been validated and the project has been reviewed.

## Conclusion

The documentation and scripts in this repository provide an instructor-ready blueprint for an AWS blue/green deployment strategy in eu-west-1. Actual implementation evidence should be added as screenshots and test results.

Observed result: [Update after completing the test]
Evidence: [Insert screenshot filename]

## Related documents

- [README.md](../README.md)
- [reports/testing-report.md](testing-report.md)
