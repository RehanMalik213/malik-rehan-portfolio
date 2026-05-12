// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:portfolio/core/constants/app_constants.dart';
// import 'package:portfolio/core/constants/app_images.dart';
// import 'package:portfolio/core/extensions/widget_ext/widget_extensions.dart';
// import 'package:portfolio/core/themes/app_colors.dart';
// import 'package:portfolio/core/widgets/button/app_button.dart';
// import 'package:portfolio/core/widgets/text/app_text.dart';

// class Header extends StatelessWidget {
//   const Header({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250.w,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(AppImages.header),
//           fit: BoxFit.fitWidth,
//           colorFilter: ColorFilter.mode(
//             Colors.black.withValues(alpha: 0.2),
//             BlendMode.darken,
//           ),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: .center,
//         children: [
//           Row(
//             mainAxisAlignment: .center,
//             children: [
//               AppText(
//                 text: "Malik Rehan ",
//                 fontSize: AppConstants.mediumFont,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.white,
//               ),
//               Container(
//                 padding: EdgeInsets.all(5.w),
//                 color: AppColors.primary,
//                 child: AppText(
//                   text: " Mobile App Engineer (Flutter & Kotlin) ",
//                   fontSize: AppConstants.mediumFont,
//                   color: AppColors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ).roundedCorner(15),
//             ],
//           ),

//           10.verticalSpace,
//           AppText(
//             text: "Building Solutions That Make an Impact.",
//             fontSize: AppConstants.xLargeFont,
//             fontWeight: FontWeight.w700,
//             color: AppColors.white,
//           ),
//           10.verticalSpace,
//           Row(
//             mainAxisAlignment: .center,
//             children: [
//               AppButton(
//                 title: "Download CV",
//                 onPress: () {},
//                 color: AppColors.white,
//                 hasIcon: true,
//                 iconData: Icons.download_rounded,
//               ),
//               20.horizontalSpace,
//               AppButton(
//                 title: "Contact Me",
//                 onPress: () {},
//                 color: AppColors.primary,
//                 textColor: AppColors.white,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/header2.mp4")
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.w,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : Container(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
