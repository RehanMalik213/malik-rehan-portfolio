import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/controllers/theme_controller.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeControllerProvider);

    return IconButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: theme == ThemeMode.dark
          ? Icon(Icons.dark_mode)
          : Icon(Icons.light_mode),
      onPressed: () => ref.read(themeControllerProvider.notifier).toggleTheme(),
    );
  }
}
