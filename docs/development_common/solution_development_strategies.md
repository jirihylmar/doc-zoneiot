---
title: "Solution Development Strategies"
tags:
  - :task_prototype_development
  - :task_iot_options_examples
  - :task_testing_iot_devices
---

# Solution Development Strategies

```yaml
Author: :team_jirihylmar
Created: 2025-01-12 20:41:58
Updated: 2025-01-12 20:41:58
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- Core strategy for development
```
## Early Stage Development IoT

**The image included in the project [ZONEIOT Market Landscape](/development_common/zoneiot_market_landscape_ro#zoneiot-market-landscape) *refDoc* represents a conceptual overview of the system's functionality. It should not be interpreted as a detailed functional or process diagram. The R&D activities will adhere to the following core principles:**

**Resource Optimization**

- Solutions must be low-cost and low-power consumption focused
- High-power computing platforms (e.g., Raspberry Pi) are excluded from consideration

**Cloud-Centric Architecture** 

- Primary intelligence and processing will be implemented in the cloud via IoT Core
- Edge devices will be kept minimal and efficient

**Versatile Firmware Design**

- End devices will use a single, configurable firmware base
- Device roles are dynamically assigned through IoT Core certificates
- Roles can be modified both between and during implementation sessions

**Flexible Communication**

- Each device must be capable of independent IoT Core communication when WiFi is available
- Initial development assumes WiFi accessibility (e.g., via mobile hotspot)
- Devices can function as servers for other devices when needed

**Adaptive Role Assignment**

- Even simple sensors can serve as local hubs based on power availability
- System automatically optimizes role distribution based on device capabilities and power states

**Power Management**

- Continuous operation is NOT permitted
- System activation is triggered by motion sensors
- Information sharing within the NEST (Traffic Restriction Zone) can utilize:
  - Proprietary protocols
  - Local wireless connections
  - Power-optimized communication strategies

## Cleaning Camera Screens

Idea :org_vsb mechanical solution based on hose overrun by cars >>> creates pressure >>> results to air, liquid directed to camera screen.
- [ ] TODO :org_mai Sun Jan 12 21:13:30 CEST 2025 Cleaning Camera Screens