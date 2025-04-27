import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  Locale _appLocale = const Locale('vi'); // Ngôn ngữ mặc định
  String _selectedCurrency = 'VND'; // Tiền tệ mặc định
  static const String _currencyKey =
      'selected_currency'; // Key để lưu SharedPreferences
  static const String _localeKey =
      'selected_locale'; // Key để lưu SharedPreferences

  Locale get appLocale => _appLocale;
  String get selectedCurrency => _selectedCurrency;

  SettingsProvider() {
    _loadSettings(); // Tải cài đặt khi khởi tạo
  }

  // Tải cài đặt từ SharedPreferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // Tải tiền tệ
    _selectedCurrency =
        prefs.getString(_currencyKey) ?? 'VND'; // Mặc định là USD nếu chưa có
    // Tải ngôn ngữ
    String langCode = prefs.getString(_localeKey) ?? 'vi'; // Mặc định là 'vi'
    _appLocale = Locale(langCode);

    notifyListeners();
  }

  // Lưu cài đặt vào SharedPreferences
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currencyKey, _selectedCurrency);
    await prefs.setString(_localeKey, _appLocale.languageCode);
  }

  void changeLocale(Locale newLocale) {
    if (_appLocale == newLocale) return;
    _appLocale = newLocale;
    _saveSettings(); // Lưu lại khi thay đổi
    notifyListeners(); // Thông báo thay đổi
  }

  void changeCurrency(String newCurrency) {
    if (_selectedCurrency == newCurrency) return;
    _selectedCurrency = newCurrency;
    _saveSettings(); // Lưu lại khi thay đổi
    notifyListeners(); // Thông báo thay đổi
  }
}
