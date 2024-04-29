import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class ThemeProvider extends ChangeNotifier {
  final StorageService _prefsService;
  ThemeMode _themeMode;
  Color _seedColor;

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  ThemeProvider._(this._themeMode, this._seedColor, this._prefsService);

  static Future<ThemeProvider> create() async {
    final prefsService = StorageService();
    final themeMode = await prefsService.loadThemeMode();
    final seedColor = await prefsService.loadSeedColor();
    return ThemeProvider._(themeMode, seedColor, prefsService);
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _prefsService.saveThemeMode(_themeMode);
    notifyListeners();
  }

  void randomizeSeedColor() {
    _seedColor = Color((0xFF000000) + DateTime.now().millisecond * 0xFFFFFF ~/ 1000);
    _prefsService.saveSeedColor(_seedColor);
    notifyListeners();
  }

  Future<void> loadColors() async {
    _themeMode = await _prefsService.loadThemeMode();
    _seedColor = await _prefsService.loadSeedColor();
    notifyListeners();
  }
}

// Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
// Provider.of<ThemeProvider>(context, listen: false).randomizeSeedColor();
