---
title: "ZONEIOT"
hide:
  - navigation
  - toc
---

# ZONEIOT

<figure style='text-align: center;'><img src='https://medite-sss-infpro-182059100462.s3.eu-west-1.amazonaws.com/vsbtuo/logo-mai-systems/source__standard_upload/logo-mai-systems.png' alt='logo-mai-systems' style='width: 150px; height: auto;'></figure>

<figure style='text-align: center;'><img src='https://vsbcda-dandra-com-intite-sss-infdev-wfs-182059100462.s3.eu-west-1.amazonaws.com/06d91fc8-e7dd-40b9-ae5c-9fb8f5f71541__media_items/logos_vsb/logo_440_FEI_02.png' alt='logo_440_FEI_02.png' style='width: 700px; height: auto;'></figure>

**Expert system for remote monitoring of road workplaces using IoT and advanced image processing technology**  
The project's objective is the research and subsequent development of smart components, which in their final state will form an independent system for monitoring and detecting temporary traffic signage in traffic restrictions, such as sets of signal lights, warning lights, and traffic signs in specific configurations. The system will utilize data analysis gathered from a network of sensors or images from unique cameras placed in the target area, combining and evaluating this information. The mission of the system, which will be pilot tested, is to detect the extent of damage, displacement, and the condition of traffic signage, including recording the damage event. All information about the events will be available to service organizations and third parties. See [ZONEIOT Návrh Projektu](/governance/zoneiot_navrh_projektu_ro#zoneiot-navrh-projektu) *refDoc* for details.

To contribute, use English as the primary language. See [Template](/support/template#template) *refDoc*.

## Action Plan

???+ success "Action Plan Up To Date"

	**OPENED :jirihylmar Thu Feb 06 10:00:23 CEST 2025**

	`Agenda 2024-02-06`

	- tasks review, QA
	- !!! :team_vsb all codes (variables, names, comments) has to be in English.
	- !!! :team_vsb update mkdocs with results. Method `we do it at the end` is not acceptable. In case page or task is missing, or does not fit logic, edits can be done. Everybody is expected to be able to pull / push to `mkdocs`. **Unless agreed otherwise, every team member has its own page(s) related to tasks, to minimize push pull conflicts**. In case you do not have an access to the repo get it.

	**`Results meetings 2024-01-30`**

	- [ ] TODO :team_lukasorcik 2025-01-30 10:41:17 new AWS account dedicated to the ZONEIOT project.
	- [ ] TODO :team_jakubjalowiczor metadata frontend implementation plan.
	- [ ] TODO :team_lukaskapicak 2025-01-30 10:40:06 establish testing polygon with :team_mai Radim Raška 797 820 006.
	- [ ] TODO :team_martinlysek 2025-01-30 10:40:11 messaging, preassigned ULR, measure consumption fro que / s3 write scenarios
	- [x] TODO :jirihylmar 2025-01-30 10:41:56 created AWS IoT core rule, messaging rules, lambda preassigned url, see https://github.com/jirihylmar/zoneiot-iotsystems-infdev

	**OPENED :team_jirihylmar Sat Jan 18 17:14:01 CEST 2025**

	- [x] TODO :team_vsb Sat Jan 18 18:59:24 CEST 2025 AWS access is ready, get familiar with [AWS Development Rules](/governance/zoneiot_accounts#aws-development-rules) *refDoc* and test.

	**`Results meetings 2024-01-16 and 2024-01-17`**

	- First phase of the research. :team_vsb and :team_mai will focus on a scene detection, not on the `Registration plate` detection, see also [Novost, výzkumná nejistota, kreativita, systematičnost a reprodukovatelnost](/governance/zoneiot_navrh_projektu_ro/#novost-vyzkumna-nejistota-kreativita-systematicnost-a-reprodukovatelnost) *refDoc*
	- [Testing IoT Devices](/development_devices/testing_iot_devices#testing-iot-devices) *refDoc* is taken over by :team_martintomis supported by :team_lukaskapicak.
	- :team_martinlysek will focus on EPS32, ESP32-CAM boars configuration and provision. The governing document is [Develop ESP32 Samples](/development_devices/develop_esp32_samples#develop-esp32-samples) *refDoc*.
	- :team_jakubjalowiczor will be responsible for creating applications for IoT management [AWS IoT Metadata Management](/development_aws/aws_iot_metadata_management#aws-iot-metadata-management) *refDoc*.
	- [x] TODO :team_jirihylmar Sat Jan 18 18:58:08 CEST 2025 AWS access

	**OPENED :team_jirihylmar Thu Jan 16 12:30:53 CEST 2025**

	`Agenda 2024-01-16`

	- [TODO](/todo#todo) *refDoc* check
	- New team members VSB [Team Members](/support/dictionary#team-members) *refDoc*
	- domain  zoneiot.cz, service account master@zoneiot.cz [ZONEIOT Accounts](/governance/zoneiot_accounts#zoneiot-accounts) *refDoc*
	- Discussion, approval [Solution Development Strategies](/development_common/solution_development_strategies#solution-development-strategies) *refDoc*

	**OPENED :team_jirihylmar Sat Jan 04 15:49:28 CEST 2025**

	- [ZoneIoT Naming Conventions](/development_common/zoneiot_naming_conventions#zoneiot-naming-conventions) *refDoc*
	- GitHub repositories shared `doc-zoneiot`, `zoneiot-collectors-firmware-infdev`, `zoneiot-collectors-provision-infdev`
	- :org_mai ? documentation source code access
	- shared account google to access services
	- paid service Cloude Anthropic, AWS
	- domain registration - essential for things management etc, but also for many other application where vsb.cz can not be used.

	**OPENED :team_jirihylmar Thu Jan 02 17:58:45 CEST 2025**

	`Agenda 2025-01-09`

	- Contractual issues if any
	- Shared account and domain zoneiot.xxx, services mapped to master@zoneiot.xxx
	- Access to core services (github, cloude, google, aws) verification 
	- Tasks [AWS Interfaces Definition](/development_aws/aws_interfaces_definition#aws-interfaces-definition) *refDoc*, [Testing IoT Devices](/development_devices/testing_iot_devices#testing-iot-devices) *refDoc*. formulations, understanding, first results discussion, transformation to deliverables
	- Results documentation, use of this mkdocs project.

	**OPENED :team_jirihylmar Fri Nov 15 06:44:21 CEST 2024**

	`Agenda 2024-11-19`

	- Welcome, governance
	- Discussion focused on commercial goals, the timeline, delivery of minimal examples
	- Team, named and unnamed positions
	- Documentation and reporting methods introduction, key to AI LLM advantage.

	**OPENED :team_jirihylmar Wed Nov 13 17:38:07 CEST 2024**	

	- [x] ZONEIOT project repo and documentation established.
	

