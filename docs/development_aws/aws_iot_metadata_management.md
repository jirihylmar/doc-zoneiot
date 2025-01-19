---
Title: AWS IoT Metadata Management
tags:
  - :task_iot_core_dev
  - :task_ui_requirements
  - :task_web_development
---

# AWS IoT Metadata Management

```yaml
Author: :team_jakubjalowiczor
Created: 2025-01-18 18:27:23
Master: mkdocs
Purpose:
- Manage data about Clients, Nests, Quests and Devices from well designed proprietary application.
```

## Introduction AWS IoT Metadata Management

- [ ] TODO :team_jakubjalowiczor 2025-01-18 18:29:52 get familiar and confident in building well designed system based on AWS Amplify and DynamoDB. https://docs.amplify.aws/react/start/quickstart/. Respect [AWS Development Rules](/governance/zoneiot_accounts#aws-development-rules) *refDoc*.

Inputs:

**Expected tables**

- Customers (operators of road closures)
- Nests (road closures)
- Devices (device emai, certificate, qr code etc.)
- Quests (roles of devices within Nests and time)
- Configurations (parameters for Devices dependent on Quests)
- Messages (devices will send to que in the standard structure, limited bytes, interpretation dictionary will be needed)
