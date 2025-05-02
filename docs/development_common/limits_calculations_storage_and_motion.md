---
Title: LImits Calculation Storage and Motion
tags:
  - :task_iot_market_landscape
  - :task_tech_evaluation
---

# Limits Calculation Storage and Motion

## ESP32 Camera Sensor Comparison

Table: OV3660 (3MP) vs OV5640 (5MP)

| Feature | OV3660 (3MP) | OV5640 (5MP) |
|---------|--------------|--------------|
| Native Resolution | 2048×1536 | 2592×1944 |
| Window Mode Performance | 800×600 up to 20 FPS | 640×480 up to 20 FPS, 1280×720 at 5-10 FPS |
| RAM Requirements | Works well with standard ESP32 | Requires ESP32-WROVER with PSRAM |
| Power Consumption (Est.) | ~100mA in window mode | ~140mA in window mode |
| Hardware Requirements | Standard ESP32 | ESP32-WROVER with PSRAM, 500mA+ power supply |
| Optimal Use Case | Budget-conscious or battery-powered applications | Higher quality imaging where power is less constrained |

### Power Consumption Analysis

Table: With a 2000mAh LiPo battery (3.7V)

| Configuration | System Draw | Runtime |
|---------------|-------------|---------|
| Standard ESP32 + OV3660 | ~340mA (1.12W) | ~6.6 hours |
| ESP32-WROVER + OV5640 | ~420mA (1.39W) | ~5.3 hours |

**Note:** The OV5640 configuration consumes approximately 24% more power than the OV3660 configuration.

### Window Mode Considerations

When both sensors are limited to similar window sizes:

- Both can achieve similar frame rates (up to 20 FPS at lower resolutions)
- OV5640 still requires more processing resources even in window mode
- With adequate PSRAM, the OV5640 can operate reliably in window mode
- OV5640 provides potential for higher quality with proper hardware support

## Storage Capacity Analysis

### Image Configuration

- Resolution: 1280x720 (HD)
- Bits per Pixel: 12.0
- JPEG Compression Ratio: 70%

### Image Size

- Size per Image: ~230 KB
- Size per Image (MB): 0.225 MB

### Storage Configuration

- SD Card Capacity: 32 GB
- Filesystem Efficiency: 95%
- Usable Space: 30.4 GB

### Storage Capacity

- Maximum Images: 138,764
- Recording Duration at 5 fps: 7.7 hours (0.32 days)
- Recording Duration at 10 fps: 3.85 hours (0.16 days)

## Motion Analysis

### Motion Configuration

- Frame Rate: 5 fps (lower bound of 5-10 FPS range)
- Detection Range: 5.0 meters
- Minimum Detection Time: 0.5 seconds
- Minimum Frames for Detection: 2 images

### Example Speed Analysis (30.0 km/h)

- Speed in m/s: 8.3
- Distance Between Frames: 1.67 meters
- Time in Detection Range: 1.20 seconds
- Frames While in Range: 6.0
- Detection Possible: Yes

Table: Speed Scenario Analysis

| Speed (km/h) | Speed (m/s) | Frame Distance (m) | Time in Range (s) | Frames in Range | Detection Possible |
|-------------|-------------|-------------------|------------------|----------------|-------------------|
| 10 | 2.8 | 0.56 | 3.6 | 18.0 | Yes |
| 20 | 5.6 | 1.12 | 1.8 | 9.0 | Yes |
| 30 | 8.3 | 1.67 | 1.2 | 6.0 | Yes |
| 40 | 11.1 | 2.22 | 0.9 | 4.5 | Yes |
| 50 | 13.9 | 2.78 | 0.72 | 3.6 | Yes |
| 60 | 16.7 | 3.33 | 0.6 | 3.0 | Yes |
| 70 | 19.4 | 3.89 | 0.51 | 2.6 | Yes |
| 80 | 22.2 | 4.44 | 0.45 | 2.3 | Yes |
| 90 | 25.0 | 5.00 | 0.4 | 2.0 | Yes |
| 100 | 27.8 | 5.56 | 0.36 | 1.8 | No |

## License Plate Readability

Based on the 5MP (OV5640) camera with a 20-degree field of view, license plate readability ranges are:

- **Maximum theoretical readability**: ~25.9 meters (85 feet)
- **Practical readability range**: 2-14 meters (6.5-46 feet)
  - **Optimal readability**: 2-8 meters (6.5-26 feet)
  - **Minimal reliable readability**: 8-14 meters (26-46 feet)
- **Unreliable/No readability**: Beyond 14 meters (46 feet)

### Factors Affecting License Plate Readability:

- **Lighting conditions**: Poor lighting reduces effective range by 30-50%
- **Weather conditions**: Rain, fog, or snow significantly reduce readable distance
- **Plate condition**: Dirty, damaged, or non-reflective plates are harder to read
- **Vehicle motion**: Higher speeds introduce motion blur, affecting quality
- **Angle of view**: Non-perpendicular angles reduce effective pixel density on the plate

## Implementation Recommendations

### OV3660 Implementation

- **Best for:** Battery-powered applications, projects with standard ESP32 modules
- **Recommended configuration:**
  - Standard ESP32 module
  - Window mode at 800×600 at 15-20 FPS
  - JPEG compression (quality 15-20)
  - Efficient for longer recording periods

### OV5640 Implementation

- **Best for:** Higher quality imaging where power supply is available
- **Recommended configuration:**
  - ESP32-WROVER module with PSRAM
  - Window mode at 1280×720 at 5-10 FPS
  - JPEG compression (quality 10-15)
  - Adequate power supply (minimum 500mA)
  - SD card storage with batch uploading
  - Maximum vehicle speed detection: 90 km/h at 5 FPS

### Trade-offs Consideration

When choosing between OV3660 and OV5640:
- If battery life is critical, OV3660 offers ~24% longer runtime
- If image quality is paramount and PSRAM-equipped ESP32 is available, OV5640 provides better results
- For most IoT applications with motion detection needs, the OV3660 offers sufficient quality with better efficiency