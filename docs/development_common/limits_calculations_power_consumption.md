---
Title: Limits Calculation Power Consumption
tags:
  - :task_iot_market_landscape
  - :task_tech_evaluation
---

# Limits Calculation Power Consumption

## Input Parameters

### Power Configuration
- ESP32 Deep Sleep Current: 0.05 mA
- PIR Quiescent Current: 0.05 mA
- ESP32 Active Current: 25.0 mA
- Camera Active Current: 60.0 mA
- WiFi Active Current: 
  - Transmission: 220.0 mA
  - Setup: 250.0 mA
- Camera Resolution: QVGA

### Battery Configuration
- Capacity: 2000 mAh
- Voltage: 3.7 V
- Efficiency: 80%

### Operational Parameters
- Events per day: 50 triggers
- Active time per event: 5.0 seconds
- Frames per event: 15
- Frame rate: 15 fps
- WiFi transmissions per day: 24 (hourly reporting)
- WiFi connection duration: 
  - Setup: 4.0 seconds
  - Transmission: 8.0 seconds
  - Total: 12.0 seconds per connection

## Variables and Formulas

### Core Variables
- I: Current in milliamps (mA)
- t: Time in seconds (s)
- C: Capacity in milliamp-hours (mAh)
- h: Hours (3600 seconds)
- n: Number of events/transmissions per day

### Basic Formula
Daily consumption (mAh) = (I × t × n) / 3600

## Power Consumption Analysis

### 1. Sleep Mode
Variables:
- I_sleep = I_esp32_sleep + I_pir = 0.05 mA + 0.05 mA = 0.1 mA
- t_sleep = 24h - t_active - t_wifi = 23.80 hours = 85,680 seconds

Calculation:
Sleep consumption = (I_sleep × t_sleep) / 3600 = (0.1 × 85,680) / 3600 = 2.39 mAh

### 2. Event Processing
Variables:
- I_event = I_esp32_active + I_camera = 25.0 mA + 60.0 mA = 85.0 mA
- t_event = 5.0 seconds
- n_events = 50 per day

Calculation:
Event consumption = (I_event × t_event × n_events) / 3600 = (85.0 × 5.0 × 50) / 3600 = 5.90 mAh

### 3. WiFi Transmission

#### Setup Phase
Variables:
- I_setup = 250.0 mA
- t_setup = 4.0 seconds
- n_wifi = 24 per day

Calculation:
Setup consumption = (I_setup × t_setup × n_wifi) / 3600 = (250.0 × 4.0 × 24) / 3600 = 6.67 mAh

#### Transmission Phase
Variables:
- I_transmission = 220.0 mA
- t_transmission = 8.0 seconds
- n_wifi = 24 per day

Calculation:
Transmission consumption = (I_transmission × t_transmission × n_wifi) / 3600 = (220.0 × 8.0 × 24) / 3600 = 13.07 mAh

Total WiFi consumption = 6.67 + 13.07 = 19.74 mAh

### 4. Daily Totals
- Sleep Consumption: 2.39 mAh
- Event Consumption: 5.90 mAh
- WiFi Consumption: 19.74 mAh
- Total Daily Consumption: 28.03 mAh

### 5. Time Distribution
- Active Time: 0.12 hours (event processing)
- WiFi Active Time: 0.08 hours (setup + transmission)
- Sleep Time: 23.80 hours
- Total: 24.00 hours

## Battery Life Calculation

Variables:
- C_battery = 2000 mAh
- efficiency = 80%
- C_daily = 28.03 mAh (total daily consumption)

Calculations:
- Theoretical Life = C_battery / C_daily = 2000 / 28.03 = 71.4 days
- Estimated Life = Theoretical × efficiency = 71.4 × 0.80 = 57.1 days

## Traffic Scenarios Analysis

### Calculation Method
For each scenario:
1. Event consumption = (85.0 × 5.0 × n_events) / 3600
2. WiFi setup = (250.0 × 4.0 × n_wifi) / 3600
3. WiFi transmission = (220.0 × 8.0 × n_wifi) / 3600
4. Total = Sleep + Event + WiFi consumption
5. Battery Life = (2000 × 0.8) / Total

### Detailed Scenarios

#### Very Low Traffic
- Events: 10 per day
- WiFi: 12 per day
- Event: (85.0 × 5.0 × 10) / 3600 = 1.2 mAh
- WiFi setup: (250.0 × 4.0 × 12) / 3600 = 3.3 mAh
- WiFi transmission: (220.0 × 8.0 × 12) / 3600 = 5.9 mAh
- Sleep: 2.39 mAh
- Daily total: 12.79 mAh
- Battery life: (2000 × 0.8) / 12.79 = 125.1 days

#### Low Traffic
- Events: 50 per day
- WiFi: 24 per day
- Event: (85.0 × 5.0 × 50) / 3600 = 5.9 mAh
- WiFi setup: (250.0 × 4.0 × 24) / 3600 = 6.67 mAh
- WiFi transmission: (220.0 × 8.0 × 24) / 3600 = 13.07 mAh
- Sleep: 2.39 mAh
- Daily total: 28.03 mAh
- Battery life: (2000 × 0.8) / 28.03 = 57.1 days

#### Medium Traffic
- Events: 200 per day
- WiFi: 48 per day
- Event: (85.0 × 5.0 × 200) / 3600 = 23.6 mAh
- WiFi setup: (250.0 × 4.0 × 48) / 3600 = 13.33 mAh
- WiFi transmission: (220.0 × 8.0 × 48) / 3600 = 26.13 mAh
- Sleep: 2.39 mAh
- Daily total: 65.45 mAh
- Battery life: (2000 × 0.8) / 65.45 = 24.4 days

#### High Traffic
- Events: 500 per day
- WiFi: 96 per day
- Event: (85.0 × 5.0 × 500) / 3600 = 59.0 mAh
- WiFi setup: (250.0 × 4.0 × 96) / 3600 = 26.67 mAh
- WiFi transmission: (220.0 × 8.0 × 96) / 3600 = 52.27 mAh
- Sleep: 2.39 mAh
- Daily total: 140.33 mAh
- Battery life: (2000 × 0.8) / 140.33 = 11.4 days

#### Very High Traffic
- Events: 1000 per day
- WiFi: 144 per day
- Event: (85.0 × 5.0 × 1000) / 3600 = 118.1 mAh
- WiFi setup: (250.0 × 4 × 144) / 3600 = 40.0 mAh
- WiFi transmission: (220.0 × 8.0 × 144) / 3600 = 78.4 mAh
- Sleep: 2.39 mAh
- Daily total: 238.89 mAh
- Battery life: (2000 × 0.8) / 238.89 = 6.7 days

### Summary Table

| Traffic Level | Events/Day | WiFi/Day | Event (mAh) | WiFi Total (mAh) | Daily Total (mAh) | Battery Life (days) |
|--------------|------------|----------|-------------|------------------|------------------|-------------------|
| Very Low | 10 | 12 | 1.2 | 9.2 | 12.79 | 125.1 |
| Low | 50 | 24 | 5.9 | 19.74 | 28.03 | 57.1 |
| Medium | 200 | 48 | 23.6 | 39.46 | 65.45 | 24.4 |
| High | 500 | 96 | 59.0 | 78.94 | 140.33 | 11.4 |
| Very High | 1000 | 144 | 118.1 | 118.4 | 238.89 | 6.7 |

## Notes and Assumptions

1. Power Calculations
   - All calculations assume stable voltage
   - Temperature effects not included
   - Linear battery discharge assumed

2. WiFi Connection
   - Each connection includes setup and transmission phases
   - Connection quality assumed optimal
   - No retry mechanism included in calculations

3. Battery Performance
   - 80% efficiency factor accounts for:
     - Temperature variations
     - Voltage converter losses
     - Battery self-discharge
   - No battery aging effects included

4. Operational Assumptions
   - Consistent daily usage pattern
   - Even distribution of events
   - Successful first-attempt WiFi connections
   - No system failures or retries

5. Environmental Factors
   - Room temperature operation
   - Good WiFi signal strength
   - No interference considerations
