// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class ThemeController extends GetxController{
//   final box = GetStorage();
//   final key = "isDarkMode";
//
//   bool loadTheme ()=> box.read(key) ?? false;
//   void saveTheme(bool isDarkMode) => box.writeInMemory(key, isDarkMode);
//
//   void changeTheme(ThemeData theme) => Get.changeTheme(theme);
//   void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
//
//   ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;
// }
