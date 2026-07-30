# Architecture description

This document explains the design choices and operating model for the AWS blue/green deployment capstone.

## Component responsibilities

- Blue EC2 instance: current production web tier for Version 1.
- Green EC2 instance: candidate release web tier for Version 2.
- Application Load Balancer: distributes traffic to Blue and Green target groups.
- Target groups: maintain separate health checks and routing behavior for each environment.
- CloudWatch: collects metrics and provides alarms for abnormal behavior.
- SNS: delivers email notifications for alarm events.

## Traffic flow

Internet users connect to the Application Load Balancer in eu-west-1. The ALB routes requests to the active target group based on the listener rule and target-group weights. Blue receives production traffic at the beginning of the deployment, while Green is validated separately before traffic is shifted.

## Environment separation

Blue and Green are deployed as separate EC2 environments so that production remains available during validation. The design keeps the current production version intact while the new candidate version is tested in parallel.

## Environment parity

The Green environment should be configured to mirror Blue as closely as possible. The same AMI family, application port, health-check path, security-group behavior, and instance profile should be reviewed before switching traffic.

## Health-check behavior

Each target group uses HTTP health checks on port 80 and path /. Healthy targets receive traffic. Unhealthy targets are removed from the routing pool until they recover.

## Zero-downtime reasoning

The design is intended to minimize disruption rather than guarantee absolute zero downtime. Blue remains available during validation, and traffic can be shifted gradually to Green using weighted routing. This reduces risk and ensures a fast rollback path when needed.

## Failure handling

If Green shows elevated errors, unhealthy targets, or degraded response times, traffic should be returned to Blue immediately. The rollback path is documented in [deployment/rollback-plan.md](../deployment/rollback-plan.md).

## Data-tier considerations

This capstone focuses on the web-tier blue/green deployment pattern. In a broader three-tier architecture, Amazon RDS MySQL could be shared or replicated carefully between the environments. Destructive or backward-incompatible database changes should not be applied without a separate migration and rollback strategy.

## Security considerations

Do not include credentials, access keys, or private IP addresses in repository content or screenshots. Security-group rules should be reviewed so that only the required traffic is allowed to the web servers.

## Related documents

- [README.md](../README.md)
- [deployment/traffic-switch-guide.md](../deployment/traffic-switch-guide.md)
