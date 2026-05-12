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
  final double? textFontSize;
  final FontWeight? textFontWeight;
  final Color? color;
  final bool hasIcon;
  final IconData? iconData;
  const AppButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.loading = false,
    required this.onPress,
    this.textColor,
    this.color,
    this.textFontSize,
    this.textFontWeight,
    this.hasIcon = false,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 15.w),
      // height: (height ?? 0).w,
      // width: (width ?? 0).w,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: loading
                ? CircularProgressIndicator(color: Colors.white)
                : AppText(
                    text: title,
                    color: textColor,
                    fontSize: textFontSize ?? AppConstants.mediumFont,
                    fontWeight: textFontWeight ?? FontWeight.w500,
                  ),
          ),
          if (hasIcon)
            iconData != null ? Icon(iconData!, size: 20.w) : SizedBox.shrink(),
        ],
      ),
    ).onViewClick(onPress);
  }
}
