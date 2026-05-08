import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {
  static Future<void> display({
    required BuildContext context,
    required Widget child,
    double topRightRadius = 20,
    double topLeftRadius = 20,
    bool fullScreen = false,
    double height = 430,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: fullScreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRightRadius.r),
          topLeft: Radius.circular(topLeftRadius.r),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: SizedBox(height: height.h, child: child),
        );
      },
    );
  }
}
