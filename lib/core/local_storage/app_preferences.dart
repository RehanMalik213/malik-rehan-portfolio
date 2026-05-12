import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._internal();

  static final AppPreferences instance = AppPreferences._internal();

  static const String _keyThemeMode = 'theme_mode';
  static const String _keyBearerToken = 'bearer_token';
  static const String _keyFcmToken = 'fcm_token';

  late final SharedPreferences _prefs;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('Call init() first');
    }
  }

  // -----------------------
  // Auth Token
  // -----------------------

  Future<void> saveBearerToken(String token) async {
    _ensureInitialized();
    await _prefs.setString(_keyBearerToken, token);
  }

  String? getBearerToken() {
    _ensureInitialized();
    return _prefs.getString(_keyBearerToken);
  }

  Future<void> clearBearerToken() async {
    _ensureInitialized();
    await _prefs.remove(_keyBearerToken);
  }

  bool hasBearerToken() {
    _ensureInitialized();
    final token = getBearerToken();
    return token != null && token.isNotEmpty;
  }

  // -----------------------
  // FCM Token
  // -----------------------

  Future<void> saveFcmToken(String token) async {
    _ensureInitialized();
    await _prefs.setString(_keyFcmToken, token);
  }

  String? getFcmToken() {
    _ensureInitialized();
    return _prefs.getString(_keyFcmToken);
  }

  bool hasFcmToken() {
    _ensureInitialized();
    final token = getFcmToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> clearFcmToken() async {
    _ensureInitialized();
    await _prefs.remove(_keyFcmToken);
  }

  // -----------------------
  // Theme
  // -----------------------

  Future<void> saveThemeMode(int index) async {
    _ensureInitialized();
    await _prefs.setInt(_keyThemeMode, index);
  }

  ThemeMode getThemeMode() {
    _ensureInitialized();
    final index = _prefs.getInt(_keyThemeMode);
    if (index != null && index >= 0 && index < ThemeMode.values.length) {
      return ThemeMode.values[index];
    }
    return ThemeMode.system;
  }
}
