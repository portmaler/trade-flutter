import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeToggleController extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";

  bool isDarkMode = true;

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
    update();
  }

  ThemeMode themeMode = ThemeMode.dark;

  /*ThemeToggleController() {
    if (themeMode == ThemeMode.dark)
      isDarkMode = true;
    else
      isDarkMode = false;
  }*/

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    update();
    isDarkMode = !isDarkMode;
    update();
  }
}
