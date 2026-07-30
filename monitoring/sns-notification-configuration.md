# SNS notification configuration

This document explains how to create and configure an SNS topic for deployment alerts.

## SNS topic

- Topic name: bluegreen-deployment-alerts
- Type: Standard topic

## Console steps

1. Open the SNS console in eu-west-1.
2. Create a topic named bluegreen-deployment-alerts.
3. Create an email subscription.
4. Confirm the email subscription from the inbox.
5. Attach the topic to the CloudWatch alarms created earlier.
6. Test the notification flow safely by triggering an alarm under controlled conditions.

## Notification guidance

- Keep the notification content concise and focused on the alarm name and severity.
- Avoid including secrets, access keys, or sensitive account details in notifications.
- Use email subscriptions for operational visibility during the capstone exercise.

## Related documents

- [README.md](../README.md)
- [monitoring/cloudwatch-alarm-configuration.md](cloudwatch-alarm-configuration.md)
