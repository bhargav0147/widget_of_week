import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_of_week/Presentation/Themes/app_theme.dart';

class SliderController extends GetxController
{
  RxList<Color> colorList = <Color>[
    AppColors.blue,
    AppColors.brown,
    AppColors.cyan,
    AppColors.green,
    AppColors.orange,
    AppColors.pink,
    AppColors.purple,
    AppColors.red,
    AppColors.teal,
    AppColors.yellow,
  ].obs;

  RxDouble androidSliderValue = 0.2.obs;
  RxDouble iosSliderValue = 0.2.obs;

  Rx<Color> sliderColor = AppColors.amber.obs;

  void  changeColor(int index) => sliderColor.value = colorList[index];
}