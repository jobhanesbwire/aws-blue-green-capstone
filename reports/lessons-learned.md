# Lessons learned

The following lessons are framed as project-level learning outcomes for the capstone and should be updated once actual observations are available.

## Environment parity

Maintaining parity between Blue and Green is essential. Differences in AMI, instance type, security-group rules, or health-check configuration can lead to false confidence during validation.

## Health checks

Health checks should reflect the actual application behavior. A shallow or incorrect health-check rule can make an unhealthy environment appear healthy.

## Smoke tests

Smoke tests should validate both the page content and the health endpoint. They provide a fast check before broader traffic changes.

## Weighted traffic shifting

Gradual traffic shifting allows the operations team to detect issues before full cutover. It is safer than a sudden complete migration.

## Monitoring user-facing metrics

CloudWatch metrics such as 5xx errors, response time, and target health are more meaningful than a single server health signal when assessing a deployment.

## Rollback speed

A rollback plan should be ready before the deployment begins. The faster the rollback takes place, the lower the user impact.

## Retaining Blue

Keeping Blue running until Green has passed the agreed stability period reduces the risk of extended outages.

## Security-group design

Security-group design should be reviewed carefully so that only the expected ports and protocols are allowed.

## Documentation

Clear documentation supports both the review process and the handoff to the next operator or instructor.

## Cost and cleanup

Temporary environments and monitoring resources should be cleaned up carefully once the deployment is complete and the evidence has been captured.

## Related documents

- [README.md](../README.md)
- [reports/testing-report.md](testing-report.md)
