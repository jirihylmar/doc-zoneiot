---
Title: AWS IoT Metadata Management
tags:
  - :task_iot_core_dev
  - :task_ui_requirements
  - :task_web_development
---

# AWS IoT Metadata Management

```yaml
Author: :team_lukasorcik
Created: 2025-01-18 18:27:23
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- Manage data about Clients, Nests, Quests and Devices from well designed proprietary application.
```

## Introduction AWS IoT Metadata Management

- OPENED :team_jirihylmar Mon Feb 24 14:12:46 CEST 2025 task will not be done by :team_jakubjalowiczor. Instead :team_lukasorcik and :team_jirihylmar will deliver the solution.

- [x] TODO :team_jakubjalowiczor 2025-01-18 18:29:52 get familiar and confident in building well designed system based on AWS Amplify and DynamoDB. https://docs.amplify.aws/react/start/quickstart/. Respect [AWS Development Rules](/governance/zoneiot_accounts#aws-development-rules) *refDoc*.

Inputs:

**Expected tables**

- Customers (operators of road closures)
- Nests (road closures)
- Devices (device emai, certificate, qr code etc.)
- Quests (roles of devices within Nests and time)
- Configurations (parameters for Devices dependent on Quests)
- Messages (devices will send to que in the standard structure, limited bytes, interpretation dictionary will be needed)

---

:team_jakubjalowiczor output

```
Material UI
https://mui.com/
Jedná se o jednu z nejpoužívanějších knihoven React komponent.
Vhodné tehdy, pokud by mělo jít o úplně custom řešení.

Creative Tim templates
https://www.creative-tim.com/templates/react-free
Používá u některých šablon Material UI knihovnu, kde už je poskládaný celý dashboard.
Velký výběr různých předpřipravených dashboardů.

CoreUI
https://coreui.io/product/free-react-admin-template/
Nabízí velké množství předpřipravených komponent.
Některé komponenty dostupné jen v placené verzi.

Horizon UI
https://horizon-ui.com/
Široká nabídka předpřipravených komponent, nicméně většina z nich je v Pro verzi, která je placená.

Refine
https://refine.dev/
Příliš komplexní pro výslednou frontend aplikaci
Závěr jsem nedělal, protože jsem zatím neměl úplně kompletní shrnutí všech požadavků na výslednou FE aplikaci. Nicméně, nejlépe se mi jeví některá ze šablon od Creative Tim nebo použití CoreUI.
```

---