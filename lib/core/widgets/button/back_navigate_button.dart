import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/extensions/widget_ext/widget_extensions.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class BackNavigateButton extends StatelessWidget {
  final Function()? onBack;
  const BackNavigateButton({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Row(
        children: [
          Icon(Icons.arrow_back_rounded, color: primaryColor),
          3.horizontalSpace,
          AppText(text: AppStrings.back),
        ],
      ).onViewClick(() => onBack?.call()),
    );
  }
}
