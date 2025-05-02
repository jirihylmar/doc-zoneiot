---
Title: Limits Cameras
tags:
  - :task_iot_market_landscape
  - :task_tech_evaluation
  - :task_hw_selection
---

```yaml
Author: :team_jirihylmar
Created: 2025-03-02 08:04:45
Master: ~/doc-zoneiot/docs/development_common/esp_camera_implementation.md
Contributors: :team_jirihylmar
Purpose:
- Efficient use of cameras resolution
```

# Limits Cameras

## Camera Sensor Limits

### Camera Sensors for ESP32

1. **2MP (OV2640) - Most Practical**
   - Resolution: 1600×1200
   - Window Mode: Very stable at 640×480 up to 30 FPS
   - RAM Usage: Manageable with standard ESP32
   - Availability: Widely available in ESP32-CAM modules
   - Performance: Excellent balance of quality and speed

2. **3MP (OV3660) - Good Balance**
   - Resolution: 2048×1536
   - Window Mode: Good at 800×600 up to 20 FPS
   - RAM Usage: Works well with standard ESP32
   - Performance: Slight quality improvement over 2MP with minimal tradeoffs

3. **5MP (OV5640) - Upper Practical Limit**
   - Resolution: 2592×1944
   - Window Mode: Functional at 1280×720 up to 10 FPS
   - RAM Usage: Requires careful memory management
   - Performance: Good with ESP32-WROVER (with PSRAM)
   - Limitations: Lower frame rates for larger windows

### Performance Expectations with 5MP Sensor

With a 5MP sensor on ESP32 using window mode:

1. **Small window (640×480)**:
   - Up to 20 FPS possible
   - Excellent quality in narrow field of view
   - Low memory impact

2. **Medium window (1280×720)**:
   - 5-10 FPS realistic
   - Good balance of field of view and detail
   - Moderate memory impact

3. **Large window (1920×1080)**:
   - 1-3 FPS practical limit
   - Significant memory pressure
   - Requires PSRAM and optimized code

### Implementation Recommendations

For the most realistic high-quality implementation:

1. **Hardware configuration**:
   - ESP32-WROVER module (with PSRAM)
   - OV5640 5MP camera module
   - Adequate power supply (minimum 500mA)

2. **Software approach**:
   - Use JPEG compression (quality 10-15)
   - Implement window mode at 1280×720
   - Target 5-8 FPS for reliable operation
   - Use SD card storage with batch uploading

## Window View

For a 5MP OV5640 sensor:

- Full resolution: 2592×1944 pixels
- FOV: 20° horizontal and 20° vertical

Common window mode resolutions for the OV5640 while maintaining the FOV would be:
- 1296×972 (1/2 resolution in each dimension)
- 864×648 (1/3 resolution in each dimension)
- 648×486 (1/4 resolution in each dimension)

The most likely window size would be 1296×972, which is half the full resolution in each dimension, providing a good balance between performance and image quality while maintaining the 20° field of view. This means the sensor would use a smaller central portion of its pixels (approximately 1/4 of the total pixel count) while still covering the same field of view as shown in your diagrams.


## License Plate Readability

At what distance a car registration license plate would be machine readable using a 5MP (OV5640) camera with a 20-degree field of view

### License Plate Readability Requirements

1. **License plate dimensions**: 
   - Typical US license plate: ~12 inches × 6 inches (30cm × 15cm)
   - Characters are typically ~2.5-3 inches (6-7.5cm) tall

2. **Machine readability requirements**:
   - Minimum 15-20 pixels per character height for reliable OCR
   - Ideally 30+ pixels per character for robust recognition
   - Minimum 2-3 pixels between characters

### Camera Specifications Analysis

For a 5MP OV5640 sensor:
- Native resolution: 2592×1944 pixels
- Using window mode at full resolution
- 20-degree field of view (horizontal FOV)

### Distance Calculation

1. **Field of view coverage**:
   - At distance D, a 20-degree horizontal FOV covers: 2 × D × tan(10°) = 0.35 × D

2. **Pixels per unit length**:
   - Horizontal resolution / horizontal FOV = 2592 / (0.35 × D) = 7406 / D pixels per meter

3. **For character recognition**:
   - Character height (7cm) needs at least 20 pixels
   - 7cm × (7406 / D) pixels/meter × (1 meter / 100cm) = 518.4 / D pixels
   - Setting this equal to 20 pixels: 518.4 / D = 20
   - D = 25.9 meters (85 feet) for minimum readability

4. **For optimal recognition**:
   - 30+ pixels per character height is recommended
   - 518.4 / D = 30
   - D = 17.3 meters (57 feet) for optimal readability

### Practical Limitations

Several factors may reduce this theoretical maximum distance:

1. **Lens quality**: Lower quality lenses reduce effective resolution
2. **Lighting conditions**: Poor lighting decreases recognition distance by 30-50%
3. **Motion blur**: Moving vehicles require faster shutter speeds, affecting quality
4. **Weather/atmospheric conditions**: Rain, fog, etc. reduce effective range
5. **Angle of view**: Non-perpendicular angles reduce readability

### Real-world Maximum Distance

Accounting for these practical limitations, a more realistic maximum distance would be:
- **Minimal readability**: ~15-20 meters (49-65 feet)
- **Reliable readability**: ~10-12 meters (33-39 feet)
- **Optimal readability**: ~5-8 meters (16-26 feet)

To achieve license plate recognition at greater distances, you would need either:
1. A higher resolution sensor
2. A narrower field of view (telephoto lens)
3. A combination of both

## Drawings


![camera_20_a_overview.svg](https://medite-sss-infpro-182059100462.s3.eu-west-1.amazonaws.com/vsbtuo/camera_20_a_overview/source__standard_upload/camera_20_a_overview.svg)

![camera_20_b_side.svg](https://medite-sss-infpro-182059100462.s3.eu-west-1.amazonaws.com/vsbtuo/camera_20_b_side/source__standard_upload/camera_20_b_side.svg)

![camera_20_c_top.svg](https://medite-sss-infpro-182059100462.s3.eu-west-1.amazonaws.com/vsbtuo/camera_20_c_top/source__standard_upload/camera_20_c_top.svg)

## Existing Products Examples

[https://shop.m5stack.com/products/esp32-psram-timer-camera-x-ov3660](https://shop.m5stack.com/products/esp32-psram-timer-camera-x-ov3660)

ESP Test of FPS. [https://www.youtube.com/watch?v=BCvOBMQSliY](https://www.youtube.com/watch?v=BCvOBMQSliY)

ESP Recording to SD [https://github.com/jameszah/ESP32-CAM-Video-Recorder-junior/blob/master/README.md](https://github.com/jameszah/ESP32-CAM-Video-Recorder-junior/blob/master/README.md)


ESP AI Testing [https://github.com/SensorsIot/Cat-Detector-with-ChatGPT-and-ESP32/blob/main/CAT_DetectorV3/CAT_DetectorV3.ino](https://github.com/SensorsIot/Cat-Detector-with-ChatGPT-and-ESP32/blob/main/CAT_DetectorV3/CAT_DetectorV3.ino)

Casing [https://core-electronics.com.au/guides/wireless/esp32-cam-set-up/](https://core-electronics.com.au/guides/wireless/esp32-cam-set-up/)