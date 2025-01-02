---
title: "Dictionary"
tags:
  - :system_document
---

# Dictionary

```yaml
Author: :team_jirihylmar
Created: 2024-11-14 11:32:01
Updated: 2024-11-15 10:29:58
Master: mkdocs
Contributors: :team_vsb, :team_mai
Purpose:
- establish project dictionary
- enable concise resource tagging with snippets
- automate reporting of the `ZONEIOT` project.
```

???+ warning "RELATED RESOURCES"
	- `~/doc-zoneiot/extract_snippets_from_dictionary.py`

## Notes

- DC Stays for the activity in project (from Czech `Dílčí činnost`)
- T stays for the task
- :org_mai = Mobility and Intelligence s.r.o.
- :org_vsb = VSB - Technical University of Ostrava
- Unnamed positions included with placeholder tags based on their roles
- All positions from the document included, both named and unnamed

## Team Members

Team members are named or unnamed. Unnamed are flexible positions.

- [ ] TODO :org_mai Fri Nov 15 07:26:51 CEST 2024 nominate unnamed positions
- [x] TODO :org_vsb Fri Nov 15 07:26:51 CEST 2024 nominate unnamed positions

Table: Team Members

| Name | Mobile Phone | Email | Name Tag | Organization Tag | Role |
|------|--------------|--------|-----------|-----------------|------|
| Marek Ščerba | +420606689956 | marek.scerba@seznam.cz | :team_marekscerba | :org_mai | Project Manager |
| Martin Hájek | +420731564000 | martin.hajek@moravialab.cz | :team_martinhajek | :org_mai | Traffic Specialist |
| Jan Mynařík | +420604486849 | jan.mynarik@gmail.com | :team_janmynarik | :org_mai | Programmer Analyst |
| Lukáš Orčík | +421915161813 | lukas.orcik@vsb.cz | :team_lukasorcik | :org_vsb | Research Developer |
| Lukáš Kapičák | +420731663275 | lukas.kapicak@vsb.cz | :team_lukaskapicak | :org_vsb | Assistant |
| Jiří Hylmar | +420736504011 | jiri.hylmar@vsb.cz | :team_jirihylmar | :org_vsb | Research Developer |
| Miroslav Vozňák | +420603565965 | miroslav.voznak@vsb.cz | :team_miroslavvoznak | :org_vsb | Professor |
| Martin Lysek | - | martin.lysek.st@vsb.cz | :team_martinlysek | :org_vsb | Embedded Systems Developer |
| [Unnamed 1] | - | - | :team_productspec | :org_mai | Product Specialist |
| [Unnamed 2] | - | - | :team_hwspec | :org_mai | Hardware Specialist |
| [Unnamed 3] | - | - | :team_servicetech | :org_mai | Service Technician |
| [Unnamed 4] | - | - | :team_programmer | :org_mai | Programmer |
| [Unnamed 5] | - | - | :team_mlprogrammer | :org_vsb | Machine Learning Programmer |
| [Unnamed 6] | - | - | :team_intprogrammer | :org_vsb | Integration Programmer |

## Planned Project Activities

Project activities are fixed. They will reported in the project progress report.

Table: Planned Project Activities

| DC | Name and Description | Responsibility | Cooperation | End Date |
|----|---------------------|----------------|-------------|-----------|
| **DC01** | Analysis of data sources, their collection possibilities and integration into database environment. Testing usability of available technologies (LoRa, GSM) for Back Office communication. Will include definition of system input interfaces. | VSB | MAI | 1/4 year |
| **DC02** | IoT core development. Includes authorized device communication, preparation of dictionaries and information storage structures, IoT device configuration system. Includes development of automation working sequences for acceptance, confirmation and event processing. | VSB | MAI | 3/4 year |
| **DC03** | Creation of system analysis, system architecture, process analysis | MAI | VSB | 1/4 year |
| **DC04** | Database preparation and machine learning algorithms - learning process testing. Scene definition, creation of ML/AI model recognition algorithms. | VSB | MAI | 4/4 year |
| DC05 | Legal analysis of camera footage usability for claiming damages on road infrastructure elements. For this DC we will use subcontracting from a respected company dealing with this issue. | MAI | - | 4/4 year |
| DC06 | Assignment of specific scenarios and use cases for work site monitoring. Activities will include selection and procurement of HW components for micro-controller and smart base for directional board | MAI | VSB | 1/2 year |
| DC07 | Preparation of datasets (training set, validation set, test set) according to set requirements of chosen machine learning methods. Includes preparation of possible configurations of temporary traffic signs and their correct and faulty (damaged variants). Data will be captured at selected workplaces under various conditions to create representative datasets for model training. | VSB | MAI | 4/4 year |
| DC08 | Testing of monitoring devices for traffic sign element position monitoring needs. Testing will initially take place in laboratory conditions and subsequently using simulated impacts, falls to determine robustness and reliability. In the project we expect both testing of more robust micro-controllers with greater possibilities but also consumption, as well as simpler ones that don't support classical Linux-type OS but enable achievement of required functionality. In image capture area, it will be necessary to solve lighting conditions, especially backlight problem at night, but also sufficient pixel resolution for license plate detection. | MAI | VSB | 4/4 year |
| DC09 | Preparation of comprehensive documentation of "Smart Base" and initiation of utility model proceedings | MAI | VSB | 3/4 year |
| DC10 | Database preparation and machine learning algorithms - testing of learning process especially video processing. | VSB | MAI | 3/4 year |
| DC11 | Definition of requirements for application control graphical interface (dispatch application). Creation of wire-frames, control description and application structure. Interface for communication with back office will be prepared. This application will be prepared in hybrid environment for concurrent use on mobile phone. | MAI | VSB | 1/4 year |
| DC12 | Coding of Web dispatch application (SW) and its finalization so that system is ready for testing. | MAI | VSB | 1/2 year |
| DC13 | Creation of test version of micro-controller for individual station types. Partial goal includes creation of "Smart Base" for directional board. | VSB | MAI | 1/2 year |
| DC14 | Processing of methodological manual for implementation of remote monitoring of temporary traffic control elements | MAI | VSB | 1/2 year |
| DC15 | Data evaluation and calibration of detection algorithms. Also includes verification of output values and reliability of provided detected information. Testing will already be carried out in prepared chassis first in laboratory conditions to be ready for pilot testing in real conditions. Technology will be environment with pre-prepared computing resources and series of existing models. Suitable model or models will be selected, used as basis and subsequently modified for project needs. After achieving results meeting predefined quality criteria, model simplification will be performed to reduce its energy demands. Optimized model will then be modified for use in micro-controller. | VSB | MAI | 1/2 year |
| DC16 | Back office coding (SW) and integration of relevant data sources. This activity will already be started in previous phase. | MAI | VSB | 4/4 year |
| DC17 | Coding of module (SW) for event detection. Individual events will be defined for alert states for individual use cases. Main two will include recording of light set damage and detection of sign falling or rotation. For operator level includes connection of information from IoT core solution part to operator application. Operator application will thus have database filled from two main sources. First is aforementioned IoT core with information about operation and configurations of workplace monitoring installations, second part is additional data about workplace configuration entered by operator. | VSB | MAI | 4/4 year |
| DC18 | Functional sample of system for temporary traffic sign element damage detection. Micro-controller using IP camera for accident detection or other events of signal light set with possibility of accident recording. | VSB | MAI | 4/4 year |
| DC19 | Pilot testing of system in real conditions including SW detection of temporary traffic sign element damage | MAI | VSB | 4/4 year |
| DC20 | Evaluation of reliability of temporary traffic sign element damage detection for individual applications and implementation of testing conclusions into preparation of final version of SW tools | MAI | VSB | 4/4 year |

## Planned Project Tasks

Project tasks are flexible, but they always have to belong to the pro project activity.

Maintenance is done by project managers :org_mai and :org_vsb. Keeping `activity_master_code` the rule. Think twice before introducing `activity_code` and `activity_tag`.

- [x] TODO :team_jirihylmar Fri Nov 15 06:46:35 CEST 2024 expand a content of deliverables for the initial testing phase.

Table: Planned Project Tasks

| activity_master_code | activity_code | activity_tag | activity_name | activity_description | responsibility_person_tag | responsibility_organization_tag | time_planned | time_executed |
|---------------------|---------------|--------------|---------------|---------------------|--------------------------|--------------------------------|--------------|---------------|
| DC01 | T01_A | :task_iot_market_landscape | IoT Market Landscape | Available technical solutions, vendors, market trend | :team_jirihylmar | :org_vsbtuo | 202501 | 202501 |
| DC01 | T01_B | :task_data_sources_analysis | Data Sources Analysis | Analysis and documentation of data collection systems | :team_lukasorcik | :org_vsbtuo | 202501 | |
| DC01 | T01_C | :task_iot_options_examples | IoT Options Examples | Minimal operation of considered IoT systems and method. Controlled and reproducible deployments. | :team_martinlysek | :org_vsbtuo | 202501 | |
| DC01 | T01_D | :task_connection_technology_evaluation | Connection Technology Evaluation | Testing LoRa and GSM for Back Office communication | :team_martinlysek | :org_vsbtuo | 202502 | |
| DC01 | T01_E | :task_aws_interfaces_definition | AWS Interfaces Definition | AWS interfaces definition, testing and documentation | :team_lukasorcik | :org_vsbtuo | 202502 | |
| DC02 | T02_A | :task_iot_core_dev | IoT Core Development | Development of device authentication and communication | :team_martinlysek | :org_vsbtuo | 202502 | |
| DC02 | T02_B | :task_data_structure | Data Structure Design | IoT information storage and dictionary preparation | :team_jirihylmar | :org_vsbtuo | 202503 | |
| DC02 | T02_C | :task_event_automation | Event Automation | Development of event processing automation | | :org_vsbtuo | 202504 | |
| DC02 | T02_D | :task_testing_iot_devices | Testing IoT Devices | Testing IoT devices selection, procurement, configuration maintenance | :team_martinlysek | :org_vsbtuo | 202503 | |
| DC03 | T03_A | :task_system_analysis | System Analysis | System architecture and requirements analysis | :team_lukasorcik | :org_mai | 202501 | |
| DC03 | T03_B | :task_process_analysis | Process Analysis | Business process analysis and documentation | | :org_mai | 202502 | |
| DC04 | T04_A | :task_ml_database | ML Database Preparation | Machine learning database setup and configuration | | :org_vsbtuo | 202504 | |
| DC04 | T04_B | :task_ml_algorithms | ML Algorithm Development | Development of recognition algorithms | | :org_vsbtuo | 202506 | |
| DC05 | T05_A | :task_legal_analysis | Legal Analysis | Analysis of camera footage legal requirements | | :org_mai | 202504 | |
| DC06 | T06_A | :task_use_case_definition | Use Case Definition | Definition of monitoring scenarios | | :org_mai | 202502 | |
| DC06 | T06_B | :task_hw_selection | Hardware Selection | Selection of micro-controller components | | :org_mai | 202503 | |
| DC07 | T07_A | :task_dataset_preparation | Dataset Preparation | Preparation of ML training datasets | | :org_vsbtuo | 202504 | |
| DC07 | T07_B | :task_data_collection | Data Collection | Collection of traffic sign configuration data | | :org_vsbtuo | 202506 | |
| DC08 | T08_A | :task_lab_testing | Laboratory Testing | Initial device testing in lab conditions | | :org_mai | 202506 | |
| DC08 | T08_B | :task_field_testing | Field Testing | Advanced testing with simulated impacts | | :org_mai | 202508 | |
| DC09 | T09_A | :task_smart_base_doc | Smart Base Documentation | Documentation of smart base design | | :org_mai | 202509 | |
| DC10 | T10_A | :task_video_processing | Video Processing | Development of video processing algorithms | | :org_vsbtuo | 202509 | |
| DC11 | T11_A | :task_ui_requirements | UI Requirements | Definition of dispatcher UI requirements | | :org_mai | 202601 | |
| DC12 | T12_A | :task_web_development | Web Development | Development of dispatcher web application | | :org_mai | 202603 | |
| DC13 | T13_A | :task_prototype_development | Prototype Development | Development of microcontroller prototype | | :org_vsbtuo | 202603 | |
| DC14 | T14_A | :task_methodology_development | Methodology Development | Development of monitoring methodology | | :org_mai | 202603 | |
| DC15 | T15_A | :task_algorithm_calibration | Algorithm Calibration | Calibration and testing of detection algorithms | | :org_vsbtuo | 202603 | |
| DC16 | T16_A | :task_backend_development | Backend Development | Development of back office system | | :org_mai | 202612 | |
| DC17 | T17_A | :task_event_detection | Event Detection | Development of event detection module | | :org_vsbtuo | 202612 | |
| DC18 | T18_A | :task_functional_sample | Functional Sample | Development of damage detection prototype | | :org_vsbtuo | 202612 | |
| DC19 | T19_A | :task_pilot_testing | Pilot Testing | System testing in real conditions | | :org_mai | 202612 | |
| DC20 | T20_A | :task_reliability_evaluation | Reliability Evaluation | Evaluation of detection reliability | | :org_mai | 202612 | |


## Deliverables

Deliverables are fixed.

:result_1_monitoring_device_gfunk
```json
{
  "id": "CL02000128-V1",
  "name_en": "Monitoring and detection device for temporary traffic signs",
  "name_cs": "Zařízení monitoringu a detekce poškození přechodného dopravního značení",
  "type": "Gfunk - Functional Sample",
  "ownership_split": "MAI 30% / VSB 70%",
  "commercialization": "7M CZK"
}
```

:result_2_damage_classifier_r
```json
{
  "id": "CL02000128-V2",
  "name_en": "Classifier for detecting damage to temporary traffic signs using machine learning",
  "name_cs": "Klasifikátor detekce poškození prvků přechodného dopravního značení z obrazu využívající strojové učení",
  "type": "R - Software",
  "ownership_split": "MAI 20% / VSB 80%",
  "commercialization": "15M CZK"
}
```

:result_3_methodical_manual_o
```json
{
  "id": "CL02000128-V3",
  "name_en": "Methodical manual for implementing remote supervision of temporary traffic control elements",
  "name_cs": "Metodická příručka pro zavádění vzdáleného dohledu prvků přechodné úpravy provozu",
  "type": "O - Other Results",
  "access": "Public web access"
}
```

:result_4_smart_base_fuzit
```json
{
  "id": "CL02000128-V4", 
  "name_en": "Smart base for direction board",
  "name_cs": "Chytrý podstavec pro směrovací desku",
  "type": "Fuzit - Utility Model",
  "ownership_split": "MAI 90% / VSB 10%",
  "commercialization": "5M CZK"
}
```

:result_5_web_dispatch_application_o
```json
{
  "id": "CL02000128-V5",
  "name_en": "Web dispatch application for testing remote monitoring system of work zones",
  "name_cs": "Webová dispečerská aplikace pro testování systému vzdáleného monitoringu pracovních míst na PK",
  "type": "O - Other Results",
  "ownership_split": "MAI 60% / VSB 40%"
}
```

## System

System tags are flexible.

:system_document
