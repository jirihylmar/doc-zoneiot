---
Title: Develop ESP32 Samples
tags:
  - :task_iot_market_landscape
  - :task_testing_iot_devices
---

# Develop ESP32 Samples

```yaml
Author: :team_martinlysek
Created: 2025-01-02 16:03:27
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- Handle configuration and reporting procedures on proofed EPS32
- Regardless of the final solution choice, this minimal implementation are vital to guiding development process
```

## Introduction Develop ESP32 Samples

- [ ] TODO :team_martinlysek 2025-01-18 17:27:01 purchase EPS32 boars and kits. Implement sample codes, commission to IoT core.

**Repository Links**

- Device Firmware: https://github.com/jirihylmar/zoneiot-collectors-firmware-infdev
- Device Provisioning: https://github.com/jirihylmar/zoneiot-collectors-provision-infdev

**Core Functionality**

The `zoneiot-collectors-firmware-infdev` codebase implements several essential features:

- Authentication and authorization
- Queue management system
- Multiple buffer handling for data storage and transmission
- Standardized message structure independent of content type
- System health monitoring (free heap reporting)
- Power management with timer-controlled deep sleep
- Timestamp standardization

Note: All modifications to these core features require prior discussion and approval.

**Development Phases and Guidelines**

Phase 1: Basic Device Commissioning

- Implement device status reporting (heap memory)
- Add pin status monitoring (high/low states)
- Develop IoT core message handling for pin control
- Set up status reporting functionality and on site led reporting logic

Phase 2: Camera Integration

- Implement IoT core messaging for S3 URL requests
- Add image capture capabilities
- Develop queue-based reporting system
- Enable single image and sequence upload to S3

Development Guidelines

- Respect [AWS Development Rules](/governance/zoneiot_accounts#aws-development-rules) *refDoc*
- Utilize Claude assistant for code development
- Maintain comprehensive code documentation and comments
- Follow standardized code organization practices
- Develop the single code with configurations options

**Hardware Requirements**

Board selection criteria must include support for:

- Touch sensors
- Voltage monitoring
- Temperature/humidity sensors
- Accelerometer
- Motion detection
- LED indicators (for Morse-code style reporting)
- Camera module
- Sufficient GPIO pins for all sensors
- Battery powered
- USB-C powered and Flashed

**In this document**

- Catalog, use established google sheet <a href='https://docs.google.com/spreadsheets/d/1Hn19guhoR5S8pZB3V2UVz7GHC-NsXhqI01vAcQzjKPE/edit?gid=0#gid=0' target='_blank'>zoneiot_testing_devices</a> all suggest other equivalent solution
- Define categories etc. component, computer, consumables, measurement, measurement_box, microcontroller, microcontroller_adapter, microcontroller_box, microcontroller_shield, power_charger, power_measurement, power_misc, power_regulator, power_source, sensor, switch_mechanical
- HW and firmware configurations maintenance suggest, reproducible to production system in future
- Developed firmware description, issues discussion.
