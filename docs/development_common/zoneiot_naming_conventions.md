---
title: "ZoneIoT Naming Conventions"
tags:
  - :system_document
---

# ZoneIoT Naming Conventions

```yaml
Author: :team_jirihylmar
Created: 2025-01-04 14:55:31
Updated: 2025-01-04 14:55:31
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- Consistent naming of resources
- Cost monitoring
```

???+ warning "RELATED RESOURCES"
	- [Dictionary](dictionary.md#dictionary) *refDoc*


## Git Repository Structure

### Base Pattern

```
zoneiot-{component}-{feature}
```

### Component Categories

- collectors  # Data collection and devices
- processors  # Processing pipelines
- detectors   # Detection systems
- monitors    # Monitoring systems
- dispatchers # Event handling
- analyzers   # Analysis systems
- configurers # Configuration management
- websystems  # Web applications
- appsystems  # Mobile applications
- iotsystems  # IoT core services
- automation  # Automation tools

### Repository Organization

#### Infrastructure & Deployment

```
zoneiot-automation-terraform    # Infrastructure as code
zoneiot-automation-ansible      # Configuration management
zoneiot-automation-deployment   # Deployment automation
zoneiot-automation-monitoring   # Monitoring setup
```

#### Device Management

```
zoneiot-collectors-firmware    # Device firmware
zoneiot-collectors-provision   # Device provisioning
zoneiot-collectors-testing     # Device testing
zoneiot-collectors-simulator   # Device simulation
```

#### Processing & Analytics

```
zoneiot-processors-pipeline   # Processing pipelines
zoneiot-processors-streaming  # Stream processing
zoneiot-processors-batch      # Batch processing
zoneiot-processors-etl        # Data transformation
```

#### Detection Systems

```
zoneiot-detectors-models     # ML models
zoneiot-detectors-training   # Model training
zoneiot-detectors-inference  # Model inference
zoneiot-detectors-datasets   # Dataset management
```

#### Monitoring & Operations

```
zoneiot-monitors-dashboard   # Monitoring UI
zoneiot-monitors-metrics     # Metrics collection
zoneiot-monitors-logging     # Logging system
zoneiot-monitors-health      # Health checking
```

#### Applications

```
zoneiot-websystems-frontend  # Web interface
zoneiot-websystems-admin     # Admin panel
zoneiot-websystems-api       # Web API
zoneiot-appsystems-android   # Android app
zoneiot-appsystems-ios       # iOS app
```

#### IoT Core

```
zoneiot-iotsystems-core      # Core IoT system
zoneiot-iotsystems-security  # Security modules
zoneiot-iotsystems-gateway   # Edge gateway
```

### Branch Strategy

```
main                           # Production code
develop                        # Development integration
feature/ZONIOT-{ticket}-{desc} # Feature branches
hotfix/ZONIOT-{ticket}-{desc}  # Hotfix branches
release/v{major}.{minor}.{patch} # Release branches
```

## AWS Resources Structure

### Base Pattern

```
zoneiot-{component}-{privacy}-{service}{version}-{env}-{account_id}
```

### Required Parameters

#### Privacy Status (6 chars)

```
intite  # Internal item
extite  # External item
```

#### Service Codes (2 chars)

```
ss  # S3 Storage
db  # DynamoDB
lm  # Lambda
ec  # EC2
cw  # CloudWatch
ag  # API Gateway
sq  # SQS
sn  # SNS
rd  # RDS
cf  # CloudFront
rt  # Route53
kn  # Kinesis
```

#### Environment (6 chars)

```
infdev  # Development
inftes  # Testing
infpro  # Production
```

#### Version (1 char)

```
0  # Testing/Development
1  # Primary Production
2  # Secondary/External
```

### AWS Resource Examples

#### S3 Buckets

```
zoneiot-collectors-intite-ss1-infpro-299025166536  # Raw data
zoneiot-processors-intite-ss1-infpro-299025166536  # Processed data
zoneiot-detectors-intite-ss1-infpro-299025166536   # ML models
```

#### DynamoDB Tables

```
zoneiot-iotsystems-intite-db1-infpro-299025166536  # Device registry
zoneiot-detectors-intite-db1-infpro-299025166536   # Detection results
zoneiot-monitors-intite-db1-infpro-299025166536    # System status
```

#### Lambda Functions

```
zoneiot-processors-intite-lm1-infpro-299025166536  # Processing
zoneiot-detectors-intite-lm1-infpro-299025166536   # ML inference
zoneiot-monitors-intite-lm1-infpro-299025166536    # Monitoring
```

#### API Gateway

```
zoneiot-websystems-intite-ag1-infpro-299025166536  # Web API
zoneiot-appsystems-intite-ag1-infpro-299025166536  # Mobile API
zoneiot-iotsystems-intite-ag1-infpro-299025166536  # IoT API
```

### Resource Tagging

```json
{
  "Project": "zoneiot",
  "Owner": "team-jirihylmar",
  "CostCenter": "cc-zoneiot-001"
}
```

## Best Practices

### General

1. Use lowercase for all names
2. Use hyphens (-) as separators for resources
3. Maintain consistent component names
4. Document any exceptions
5. Follow version numbering consistently

### Git Specific

1. Include README.md in all repositories
2. Maintain CONTRIBUTING.md guidelines
3. Include appropriate .gitignore
4. Enforce branch naming conventions
5. Use meaningful commit messages

### AWS Specific

1. Always include all required tags
2. Maintain tag consistency
3. Follow service-specific naming limits
4. Document resource relationships


