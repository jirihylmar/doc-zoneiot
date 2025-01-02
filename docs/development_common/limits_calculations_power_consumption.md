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
- WiFi Active Current: 220.0 mA
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
- WiFi transmissions per day: 24
- WiFi transmission duration: 8.0 seconds

## Power Consumption Analysis

### Daily Breakdown
- Sleep Consumption: 2.39 mAh
- Event Consumption: 5.90 mAh
- WiFi Consumption: 13.07 mAh
- Total Daily Consumption: 21.36 mAh

### Time Distribution
- Active Time: 0.12 hours
- WiFi Active Time: 0.05 hours
- Sleep Time: 23.88 hours

### Battery Life Estimates
- Theoretical Battery Life: 93.6 days
- Estimated Battery Life (with 80% efficiency): 74.9 days

## Traffic Scenarios Analysis

The following table shows how different traffic levels affect battery life:

| Traffic Level | Events/Day | WiFi/Day | Event (mAh) | WiFi (mAh) | Total (mAh) | Battery Life (days) |
|--------------|------------|----------|-------------|------------|-------------|-------------------|
| Very Low | 10 | 12 | 1.2 | 6.5 | 10.1 | 158.3 |
| Low | 50 | 24 | 5.9 | 13.1 | 21.4 | 74.9 |
| Medium | 200 | 48 | 23.6 | 26.1 | 52.1 | 30.7 |
| High | 500 | 96 | 59.0 | 52.3 | 113.6 | 14.1 |
| Very High | 1000 | 144 | 118.1 | 78.4 | 198.7 | 8.1 |
