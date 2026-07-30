# Testing report

Use this report to record the observed outcomes of the capstone validation work.

| Test ID | Test procedure | Expected result | Observed result | Evidence | Status |
| --- | --- | --- | --- | --- | --- |
| T01 | Blue instance direct access | Blue page is reachable | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T02 | Green instance direct access | Green page is reachable | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T03 | Blue health endpoint | /health returns a healthy response | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T04 | Green health endpoint | /health returns a healthy response | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T05 | Blue target-group health | Blue target is healthy | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T06 | Green target-group health | Green target is healthy | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T07 | ALB serving Blue | Production traffic reaches Blue | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T08 | 90/10 traffic configuration | Traffic shifts gradually | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T09 | 50/50 traffic configuration | Balanced traffic is visible | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T10 | Full Green cutover | Production traffic reaches Green | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T11 | CloudWatch metrics visibility | Metrics appear in CloudWatch | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T12 | CloudWatch alarm behavior | Alarm state is visible | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T13 | SNS email delivery | Notification is received | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T14 | Manual rollback | Traffic returns to Blue | [Update after completing the test] | [Insert screenshot filename] | To be verified |
| T15 | Blue service restored after rollback | Blue service remains available | [Update after completing the test] | [Insert screenshot filename] | To be verified |

## Related documents

- [README.md](../README.md)
- [reports/implementation-report.md](implementation-report.md)
