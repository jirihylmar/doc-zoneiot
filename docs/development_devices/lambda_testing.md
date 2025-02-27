---
Title: AWS Lambda Testing
tags:
  - :task_testing_iot_devices
---

# Minimal Parameters of Devices

```yaml
Author: :team_martinlysek
Created: 2025-02-27 01:00:38
Updated: 2025-02-27 01:00:38
Master: mkdocs
Purpose:
- Test AWS Lambda function
```

## Introduction - Minimal Parameters of Devices

### Changes & Updates

- Fixed existing bugs.
- Continued working on the TODO list.
- Tested camera modules.
- Cleaned and improved code readability.
- Further optimized the system with a focus on power consumption.
- Created a configuration file for easier adjustments.
- Developed a function to retrieve preassigned URLs.
- Tested the AWS Lambda function.

### Observations & Notes

- Image processing from the camera is extremely computationally demanding.
- Proper Wi-Fi and MQTT configuration significantly speeds up connection and data transmission.
- The function for retrieving preassigned URLs is not yet finished; it returns an incorrect MQTT topic.
- File upload could not be established, likely due to an excessively long AWS-generated URL.

## Comparison: MQTT vs. HTTP

Although I was unable to get the Lambda file upload working, I concluded that:

- HTTP should only be used for sending images, as transmitting JSON data over HTTP is inefficient.
- The main reason is that to send data via HTTP, the MQTT connection must be terminated and re-established for HTTP due to TLS security protocols.
- Another issue is that obtaining a preassigned URL address requires connecting to MQTT, sending a request, waiting for the assigned address, disconnecting, and reconnecting to HTTP. This process is too slow.
