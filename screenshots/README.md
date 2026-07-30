# Screenshot collection guide

This folder is reserved for the screenshots that support the AWS blue/green deployment capstone.

## Naming convention

The screenshot filenames must match the references in the root README exactly, including lowercase letters, hyphens, and the .png extension.

## Expected screenshots

- 01-region-confirmation.png — Capture the AWS console region selector showing Europe (Ireland) in eu-west-1.
- 02-blue-ec2-instance.png — Capture the Blue EC2 instance details, including the instance name blue-server.
- 03-green-ec2-instance.png — Capture the Green EC2 instance details, including the instance name green-server.
- 04-blue-target-group.png — Capture the EC2 target group configuration for blue-target-group.
- 05-green-target-group.png — Capture the EC2 target group configuration for green-target-group.
- 06-blue-target-healthy.png — Capture the Blue target group showing a healthy target status.
- 07-green-target-healthy.png — Capture the Green target group showing a healthy target status.
- 08-application-load-balancer.png — Capture the Application Load Balancer details for bluegreen-alb.
- 09-alb-listener-blue-production.png — Capture the ALB listener rule showing Blue as the current production target.
- 10-blue-version-live.png — Capture the Blue environment homepage or application response.
- 11-green-version-validation.png — Capture the Green environment validation page or application response.
- 12-weighted-traffic-rule.png — Capture the ALB rule or weighted target configuration.
- 13-green-production-live.png — Capture the Green environment after successful cutover.
- 14-cloudwatch-metrics.png — Capture CloudWatch metrics for the ALB or EC2 targets.
- 15-cloudwatch-alarm.png — Capture the CloudWatch alarm configuration page.
- 16-sns-notification.png — Capture the SNS topic and notification subscription.
- 17-rollback-to-blue.png — Capture the rollback action or traffic restoration to Blue.
- 18-final-resource-summary.png — Capture the final AWS resource summary or overview.

## How to add screenshots

1. Rename your AWS screenshots to the exact filenames above.
2. Place them in this folder.
3. Keep the file names lowercase and hyphenated.
4. Do not include private IP addresses, account IDs, access keys, or other sensitive information in the screenshots where unnecessary.
5. If you need to show sensitive values, mask or crop them before sharing.

## Notes

The repository is intended to be understandable even when screenshots are not yet present. The Markdown references in the root README will render as broken image links until the files are added.
