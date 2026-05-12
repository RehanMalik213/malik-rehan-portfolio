import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_images.dart';
import 'package:portfolio/core/extensions/hover_ext.dart';
import 'package:portfolio/core/extensions/widget_ext/widget_extensions.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';
import 'package:portfolio/features/home/presentation/widgets/custom_bold_paragraph.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final verticalSpace = SizedBox(height: 15.w);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200.w,
            height: 300.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.all(5),
            child: Image.asset(AppImages.profile, fit: BoxFit.cover),
          ),
          30.horizontalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 200.w),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  AppText(
                    text: "About Me",
                    fontSize: AppConstants.xLargeFont,
                    fontWeight: FontWeight.w700,
                  ),
                  Container(width: 130.w, height: 1, color: AppColors.primary),
                  verticalSpace,
                  CustomBoldParagraph(
                    fullText:
                        "Flutter/Kotlin Mobile Engineer with 3 years of experience building and shipping production mobile applications in mobility and e-commerce domains. Worked on real-time tracking systems, offline-first functionality, payments, push notifications, and scalable mobile architectures. Contributed to multiple production applications serving 10,000+ users.",
                    boldWords: const [
                      "Flutter/Kotlin",
                      "3 years of experience",
                      "mobility",
                      "e-commerce",
                      "10,000+ users",
                    ],
                    fontSize: AppConstants.normalFont.sp,
                  ),
                  verticalSpace,
                  Divider(color: AppColors.primary),
                  verticalSpace,
                  Row(
                    children: [
                      AppText(
                        text: "Tech Skills : ",
                        fontSize: AppConstants.mediumFont,
                        fontWeight: FontWeight.w700,
                      ),
                      15.horizontalSpace,
                      Wrap(
                        spacing: 12.w,
                        children: [
                          _buildServiceItem(skill: "Dart"),
                          _buildServiceItem(skill: "Flutter"),
                          _buildServiceItem(skill: "Kotlin"),
                          _buildServiceItem(skill: "Firebase"),
                          _buildServiceItem(skill: "Local Storage"),
                          _buildServiceItem(skill: "Websocket/Pusher"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem({required String skill}) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
      child: Center(
        child: AppText(
          text: skill,
          fontSize: AppConstants.smallFont,
          color: AppColors.white,
        ),
      ),
    ).roundedCorner(AppConstants.fullRadius).zoomOnHover();
  }
}
