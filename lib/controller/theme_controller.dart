import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  static GetStorage _box = GetStorage();
  static String _boxkey = "isDarkMode";

  static bool loadTheme() {
    return _box.read(_boxkey) ?? false;
  }

  static saveTheme(bool newValue) {
    _box.write(_boxkey, newValue);
  }

  static ThemeMode themeMode = loadTheme() ? ThemeMode.dark : ThemeMode.light;

  static void changeThemeMode() {
    if (loadTheme()) {
      themeMode = ThemeMode.light;
      Get.changeThemeMode(themeMode);
      saveTheme(!loadTheme());
    } else {
      themeMode = ThemeMode.dark;
      Get.changeThemeMode(themeMode);
      saveTheme(!loadTheme());
    }
  }

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
