// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_of_week/Presentation/Pages/Home/Widgets/home_drawer.dart';
import 'package:widget_of_week/Presentation/Themes/app_theme.dart';
import 'package:widget_of_week/Presentation/Widgets/hover_button.dart';
import 'package:widget_of_week/Utils/AppImage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HoverController hoverProjectButtonController = HoverController();
    HoverController hoverContactButtonController = HoverController();
    return Scaffold(
      // drawerEnableOpenDragGesture: false,

      drawer: const MyHomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: AppColors.amber,
              // height: 800,
              width: Get.width,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(Get.width, Get.height),
                    painter: TrianglePainter(color: AppColors.black),
                  ),
                  Container(
                    width: Get.width,
                    height: 800,
                    decoration: const BoxDecoration(
                        // color: AppColors.black,
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                                child: Image.asset(
                              AppImage.logoImage,
                              height: 650,
                            )),
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'HI, I\'M BHARGAV KALARIYA',
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white54),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      'Flutter Developer',
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      HoverButton(
                                        height: 45,
                                        width: 180,
                                        controller:
                                            hoverProjectButtonController,
                                        onPressed: () {},
                                        buttonText: 'PROJECT',
                                        borderRadius: BorderRadius.circular(8),
                                        buttonColor: AppColors.amber,
                                        hoverColor: AppColors.white38,
                                        textColor: AppColors.black,
                                        textColorAfterHover: AppColors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      HoverButton(
                                        height: 45,
                                        width: 180,
                                        controller:
                                            hoverContactButtonController,
                                        onPressed: () {},
                                        buttonText: 'CONTACT',
                                        borderRadius: BorderRadius.circular(8),
                                        buttonColor: AppColors.black,
                                        hoverColor: AppColors.white38,
                                        textColor: AppColors.white,
                                        textColorAfterHover: AppColors.white,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: Get.width,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Flutter',
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black),
                          ),
                          Builder(
                            builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 30,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = Path();
    path.moveTo(size.width / 1, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
