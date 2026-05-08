import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/extensions/widget_ext/widget_extensions.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final bool loading;
  final VoidCallback onPress;
  final Color? textColor;
  final Color? color;
  const AppButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.loading = false,
    required this.onPress,
    this.textColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60.w,
      width: width ?? 200.w,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Center(
        child: loading
            ? CircularProgressIndicator(color: Colors.white)
            : AppText(text: title),
      ),
    ).onViewClick(onPress);
  }
}
