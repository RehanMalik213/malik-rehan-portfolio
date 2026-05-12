import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class CustomBoldParagraph extends StatelessWidget {
  final String fullText;
  final List<String> boldWords;
  final double fontSize;
  final Color textColor;
  final double lineHeight;

  const CustomBoldParagraph({
    super.key,
    required this.fullText,
    required this.boldWords,
    this.fontSize = 16.0,
    this.textColor = Colors.black,
    this.lineHeight = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    final isUrdu = context.locale.languageCode == 'ur';
    if (boldWords.isEmpty) {
      return AppText(
        text: fullText,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          height: lineHeight,
        ),
      );
    }

    final String pattern =
        '(${boldWords.map((w) => RegExp.escape(w)).join('|')})';
    final RegExp regExp = RegExp(pattern, caseSensitive: false);

    final List<String> parts = fullText.split(regExp);
    final List<String?> matches = regExp
        .allMatches(fullText)
        .map((m) => m.group(0))
        .toList();

    List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i]));

      if (i < matches.length && matches[i] != null) {
        spans.add(
          TextSpan(
            text: matches[i],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }
    }

    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          height: lineHeight,
          fontFamily: isUrdu ? 'Jameel' : 'Inter',
        ),
        children: spans,
      ),
    );
  }
}
