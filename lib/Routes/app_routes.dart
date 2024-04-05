import 'package:get/get.dart';
import 'package:widget_of_week/Presentation/Pages/Home/Screen/home_page.dart';
import 'package:widget_of_week/Presentation/Pages/Slider/Screen/slider_page.dart';
import 'package:widget_of_week/Presentation/Pages/Typing_Test/Screen/speed_test_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String slider = '/slider';
  static const String speedTest = '/speedtest';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: slider, page: () => const SliderPage()),
    GetPage(name: speedTest, page: () => const SpeedTestPage()),
  ];
}
