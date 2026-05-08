import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/text/app_text.dart';

class LanguageIconButton extends StatelessWidget {
  const LanguageIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        context.setLocale(locale);
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: Locale('en'),
          child: AppText(text: 'English'),
        ),
        PopupMenuItem(
          value: Locale('ur'),
          child: AppText(text: 'Urdu'),
        ),
      ],
    );
  }
}
