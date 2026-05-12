import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/core/widgets/base_page.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';
import 'package:portfolio/features/home/presentation/widgets/about_me.dart';
import 'package:portfolio/features/home/presentation/widgets/header.dart';
import 'package:portfolio/features/home/presentation/widgets/project_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final verticalSpace = SizedBox(height: 15.w);
    return BasePage(
      isScrollEnable: true,
      disableHorizontalPadding: true,
      child: Column(
        children: [
          const Header(),
          const AboutMe(),
          const ProjectSection(),
          verticalSpace,
          AppText(
            text: "Experience",
            fontSize: AppConstants.xLargeFont,
            fontWeight: FontWeight.w700,
          ),
          Container(width: 150.w, height: 1, color: AppColors.primary),
          verticalSpace,
          AppText(text: "My professional journey"),
        ],
      ),
    );
  }
}
