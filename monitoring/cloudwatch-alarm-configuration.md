# CloudWatch alarm configuration

These instructions describe how to create CloudWatch alarms in eu-west-1 for the capstone deployment.

## Recommended alarms

1. Green UnHealthyHostCount greater than or equal to 1.
2. Green HealthyHostCount less than 1.
3. Green HTTPCode_Target_5XX_Count above an agreed threshold.
4. High TargetResponseTime.
5. EC2 StatusCheckFailed greater than or equal to 1.

Thresholds below are example starting points and should be tuned to the workload.

## Console steps

1. Open the CloudWatch console in eu-west-1.
2. Choose Alarms and create a new alarm.
3. Select the relevant metric namespace and dimension.
4. Set the statistic, period, evaluation period, and threshold.
5. Configure the alarm action to send a message to the SNS topic.
6. Save the alarm.

## Example alarm settings

- Evaluation periods: 2 or 3 periods
- Datapoints to alarm: 2 out of 3
- Missing-data treatment: Treat missing data as not breathing or not sufficient data depending on the alarm goal
- SNS notification action: bluegreen-deployment-alerts

## Example alarm names

- bluegreen-green-unhealthy-hosts
- bluegreen-green-no-healthy-hosts
- bluegreen-green-target-5xx
- bluegreen-green-high-latency
- bluegreen-green-ec2-status-check

## Notes

Alarm sensitivity should be tuned using a normal operating baseline. The initial thresholds are starting points only.

## Related documents

- [README.md](../README.md)
- [monitoring/sns-notification-configuration.md](sns-notification-configuration.md)
