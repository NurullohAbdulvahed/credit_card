import 'package:credit_card/service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService{
  // final _box = GetStorage();
  // final _key = "isDarkMode";

 bool _loadThemeFromBox()=> DBService.to.getData(StorageKeys.themeMode) ?? false;               //  _box.read(_key) ?? false;
 _saveThemeToBox(bool isDarkMode) => DBService.to.setData(StorageKeys.themeMode, isDarkMode);  //  _box.write(_key, isDarkMode);

 ThemeMode get theme => _loadThemeFromBox() ?  ThemeMode.light :  ThemeMode.dark;

 void switchTheme(){
   Get.changeThemeMode(_loadThemeFromBox() ?  ThemeMode.dark :  ThemeMode.light);
   _saveThemeToBox(!_loadThemeFromBox());
 }
}