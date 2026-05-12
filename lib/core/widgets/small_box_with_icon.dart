import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/widgets/app_image_view.dart';

class SmallBoxWithIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final IconData? icon;
  final double? iconSize;
  final Size? imageSize;
  final String? imagePath;
  final Color? iconColor;
  final Color? hoverColor;

  const SmallBoxWithIcon({
    super.key,
    this.imagePath,
    this.icon,
    this.iconColor,
    this.hoverColor,
    this.height,
    this.width,
    this.padding,
    this.iconSize,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((padding ?? 8).r),
      height: height,
      width: width,
      child: icon == null
          ? imagePath != null
                ? AppImageView(imagePath: imagePath!, imageSize: imageSize)
                : null
          : Icon(icon, size: iconSize, color: iconColor),
    );
  }
}
