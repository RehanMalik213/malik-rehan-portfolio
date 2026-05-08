import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on Widget {
  Widget onViewClick(VoidCallback? onClick) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onClick,
      child: this,
    );
  }

  Widget roundedCorner(double radius) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: this,
      ),
    );
  }
}
