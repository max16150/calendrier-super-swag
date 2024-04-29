import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class StorageService {
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', themeMode == ThemeMode.dark);
  }

  Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> saveSeedColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('seedColor', color.value);
  }

  Future<Color> loadSeedColor() async {
    final prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt('seedColor') ?? Colors.amber.value);
  }

  Future<void> saveLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', languageCode);
  }

  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('languageCode');
  }
}
