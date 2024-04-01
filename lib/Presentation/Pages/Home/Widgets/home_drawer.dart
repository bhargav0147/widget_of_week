import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_of_week/Presentation/Pages/Home/Controller/home_controller.dart';
import 'package:widget_of_week/Presentation/Themes/app_theme.dart';

class MyHomeDrawer extends StatelessWidget {
  const MyHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Widget of Week',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
              const Divider(
                color: AppColors.white38,
                thickness: 1,
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  primary: false,
                  itemBuilder: (context, index) {
                    return menuText(
                        menutext: homePageController.menuList[index],
                        path: homePageController.navigatePathList[index]);
                  },
                  itemCount: homePageController.menuList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuText({required String menutext, required String path}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: () {
            Get.toNamed(path);
          },
          child: Text(
            menutext,
            style: const TextStyle(
                letterSpacing: 1,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppColors.white70),
          ),
        ),
      ),
    );
  }
}
