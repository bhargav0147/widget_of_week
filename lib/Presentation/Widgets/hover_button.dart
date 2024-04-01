import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoverController extends GetxController {
  var isHovered = false.obs;
}

class HoverButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final double height;
  final Color buttonColor;
  final Color hoverColor;
  final Color textColor;
  final Color textColorAfterHover;
  final BorderRadiusGeometry? borderRadius;
  final HoverController? controller;

  const HoverButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.width = 160,
    this.height = 45,
    this.buttonColor = Colors.amber,
    this.hoverColor = Colors.white38,
    this.textColor = Colors.black,
    this.textColorAfterHover = Colors.black, // Default to same as textColor
    this.borderRadius,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MouseRegion(
        onEnter: (event) {
          if (controller != null) {
            controller!.isHovered.value = true;
          }
        },
        onExit: (event) {
          if (controller != null) {
            controller!.isHovered.value = false;
          }
        },
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: (controller != null && controller!.isHovered.value)
                ? hoverColor
                : buttonColor,
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white),
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: (controller != null && controller!.isHovered.value)
                    ? textColorAfterHover
                    : textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
