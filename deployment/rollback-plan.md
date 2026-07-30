# Rollback plan

## Purpose

This runbook defines the manual rollback process for the blue/green deployment so that traffic can be restored to Blue quickly if Green fails validation or causes unacceptable errors.

## Rollback triggers

Rollback should begin immediately if any of the following occur:

- Green target becomes unhealthy
- Elevated target HTTP 5xx errors are observed
- Elevated ALB 5xx errors are observed
- Response latency increases significantly
- Smoke tests fail
- The release causes a failed business function
- Error logs indicate a critical issue
- User complaints correlate with the release

## Immediate actions

1. Open the ALB listener rule in the AWS Management Console.
2. Restore the routing weights to Blue: 100 / Green: 0.
3. Stop or isolate the Green deployment if it is causing issues.
4. Keep Blue running until the issue is understood and the team is comfortable proceeding.

## AWS Console steps

- Navigate to EC2 → Load Balancers → bluegreen-alb.
- Open Listeners and rules.
- Select the HTTP:80 listener.
- Edit the forwarding action to route all traffic to blue-target-group.

## Validation after rollback

- Verify that Blue returns healthy responses.
- Re-run smoke tests against Blue.
- Review CloudWatch metrics and alarms.
- Confirm that the user-facing service is working as expected.

## Green investigation steps

- Review the Green instance logs.
- Check the target-group health state.
- Compare the Green response with Blue.
- Review CloudWatch alarms and SNS notifications.

## Communication and incident recording

Record the incident, the rollback time, the symptoms observed, and the steps taken. Notify stakeholders and preserve the evidence for the follow-up report.

## Conditions for attempting another deployment

A new deployment attempt should only proceed after the issue is investigated, fixed, and validated. Blue should remain available during the next validation cycle.

## Related documents

- [README.md](../README.md)
- [deployment/traffic-switch-guide.md](traffic-switch-guide.md)
