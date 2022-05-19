// Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
// _saveThemeStatus() async {
//   SharedPreferences pref = await _prefs;
//   pref.setBool('theme', _isLightTheme.value);
// }
//
// _getThemeStatus() async {
//   var _isLight = _prefs.then((SharedPreferences prefs) {
//     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
//   }).obs;
//   _isLightTheme.value = await _isLight.value;
//   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);

