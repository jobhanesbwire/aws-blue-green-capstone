# Blue/Green Architecture

This document provides a high-level architecture view for the AWS blue/green deployment capstone.

## Mermaid diagram

```mermaid
flowchart TD
    Users[Internet users] --> ALB[Application Load Balancer]
    ALB --> Listener[Production listener]
    Listener --> BlueTG[Blue target group]
    Listener --> GreenTG[Green target group]
    BlueTG --> BlueEC2[Blue EC2 Version 1]
    GreenTG --> GreenEC2[Green EC2 Version 2]

    BlueEC2 --> CW[CloudWatch metrics and alarms]
    GreenEC2 --> CW
    CW --> SNS[SNS email notifications]

    subgraph Rollback[Optional rollback automation]
        Alarm[CloudWatch alarm] --> EventBridge[EventBridge]
        EventBridge --> Lambda[Lambda]
        Lambda --> Rule[Modify ALB listener weights]
        Rule --> Restore[Return traffic to Blue]
    end
```

## Notes

- Blue is retained as the current production environment during validation.
- Green is introduced as the candidate release and is evaluated before traffic is shifted.
- The optional rollback flow is a design enhancement and should be implemented only after the manual process is validated.
