import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:widget_of_week/Presentation/Pages/Typing_Test/Controller/speed_test_controller.dart';
import 'package:widget_of_week/Presentation/Themes/app_theme.dart';
import 'package:widget_of_week/Presentation/Widgets/hover_button.dart';

class SpeedTestPage extends StatelessWidget {
  const SpeedTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    HoverController hoverTestButtonController = HoverController();
    final SpeedTestController speedTestController =
        Get.put(SpeedTestController());
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: const Text(
          'Speed Test',
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: AppColors.white,
            )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Progress',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LinearProgressIndicator(
                value: speedTestController.progressBarValue.value,
                minHeight: 5,
                backgroundColor: AppColors.white24,
                color: AppColors.amber,
              ),
              const Spacer(),
              SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 3000,
                axes: [
                  RadialAxis(
                    showLastLabel: true,
                    axisLabelStyle:
                        const GaugeTextStyle(color: AppColors.white),
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: 100,
                        color: AppColors.amber,
                      )
                    ],
                    pointers: [
                      NeedlePointer(
                        value: speedTestController.displayValue.value,
                        needleColor: AppColors.white,
                        enableAnimation: true,
                        knobStyle: const KnobStyle(color: AppColors.amber),
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: SizedBox(
                         
                          height: 40,
                          child: Center(
                            child: Text(
                              speedTestController.displayValue.value
                                  .toStringAsFixed(2),
                              style: const TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 1.2,
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Download Speed',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white60),
                        ),
                        Obx(
                          () => Text(
                            speedTestController.downloadValue.value.toString(),
                            style: const TextStyle(
                                letterSpacing: 1,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.amber),
                          ),
                        ),
                        const Text(
                          'Mbps',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white60),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: HoverButton(
                        height: 45,
                        width: 180,
                        controller: hoverTestButtonController,
                        onPressed: () {
                          speedTestController.testingInternetSpeed();
                        },
                        buttonText: 'Test',
                        borderRadius: BorderRadius.circular(8),
                        buttonColor: AppColors.amber,
                        hoverColor: AppColors.white38,
                        textColor: AppColors.black,
                        textColorAfterHover: AppColors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Upload Speed',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white60),
                        ),
                        Obx(
                          () => Text(
                            speedTestController.uploadValue.value.toString(),
                            style: const TextStyle(
                                letterSpacing: 1,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: AppColors.amber),
                          ),
                        ),
                        const Text(
                          'Mbps',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white60),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
