// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:widget_of_week/Routes/app_routes.dart';

class HomePageController extends GetxController {
  RxList<String> menuList = <String>[
    'Slider',
  ].obs;

  RxList<String> navigatePathList = <String>[
    AppRoutes.slider,
  ].obs;
}
