// lib/core/controller/theme_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/local_storage/app_preferences.dart';

class ThemeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return AppPreferences.instance.getThemeMode();
  }

  void toggleTheme() {
    state = (state == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    AppPreferences.instance.saveThemeMode(state.index);
  }
}

/// ************ Providers *****************
final themeControllerProvider = NotifierProvider<ThemeController, ThemeMode>(
  () {
    return ThemeController();
  },
);
