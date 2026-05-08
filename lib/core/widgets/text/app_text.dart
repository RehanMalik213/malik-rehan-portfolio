import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isUrdu = context.locale.languageCode == 'ur';
    final defaultFont = isUrdu ? 'Jameel' : 'Inter';
    return Text(
      text.tr(),
      softWrap: true,
      style:
          style?.copyWith(
            fontFamily: style?.fontFamily ?? defaultFont,
            fontSize: (fontSize ?? style?.fontSize ?? 15).sp,
            fontWeight: fontWeight ?? style?.fontWeight,
            color: color ?? style?.color,
          ) ??
          TextStyle(
            fontFamily: defaultFont,
            fontSize: (fontSize ?? 15).sp,
            fontWeight: fontWeight,
            color: color,
            height: isUrdu ? 1.5 : 1.2,
          ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
