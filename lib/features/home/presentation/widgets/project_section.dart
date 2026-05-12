import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_images.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final verticalSpace = SizedBox(height: 10.w);
    return Container(
      height: 250.w,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.projectBG),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          AppText(
            text: "My Projects",
            fontSize: AppConstants.xLargeFont,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          Container(width: 150.w, height: 1, color: AppColors.primary),
          verticalSpace,
          AppText(text: "Some of my recent work.", color: AppColors.white),
          verticalSpace,
          Container(height: 140.w, color: Colors.amber),
        ],
      ),
    );
  }
}
