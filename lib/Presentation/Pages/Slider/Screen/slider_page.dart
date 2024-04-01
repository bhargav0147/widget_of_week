import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_of_week/Presentation/Pages/Slider/Controller/slider_controller.dart';
import 'package:widget_of_week/Presentation/Themes/app_theme.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    SliderController sliderController = Get.put(SliderController());
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: SizedBox(
          height: 600,
          width: 1100,
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: AppColors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: AppColors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: AppColors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: AppColors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 475,
                    width: 950,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Slider',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    sliderController.androidSliderValue.value =
                                        0.2;
                                    sliderController.iosSliderValue.value = 0.2;
                                    sliderController.sliderColor.value =
                                        AppColors.amber;
                                  },
                                  child: Icon(
                                    Icons.settings_backup_restore,
                                    size: 30,
                                    color: AppColors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            'Android Platform',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                          Obx(
                            () => Slider(
                              activeColor: sliderController.sliderColor.value,
                              inactiveColor: AppColors.white38,
                              value: sliderController.androidSliderValue.value,
                              onChanged: (value) {
                                sliderController.androidSliderValue.value =
                                    value;
                              },
                            ),
                          ),
                          Text(
                            'IOS Platform',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                          Obx(
                            () => CupertinoSlider(
                              activeColor: sliderController.sliderColor.value,
                              value: sliderController.iosSliderValue.value,
                              onChanged: (value) {
                                sliderController.iosSliderValue.value = value;
                              },
                            ),
                          ),
                          Text(
                            'Colors',
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: ListView.builder(
                                primary: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: InkWell(
                                      onTap: () {
                                        sliderController.changeColor(index);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: sliderController
                                                .colorList[index]),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: sliderController.colorList.length,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
