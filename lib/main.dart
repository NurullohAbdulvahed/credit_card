import 'package:credit_card/language/language.dart';
import 'package:credit_card/pages/language_page.dart';
import 'package:credit_card/service/init_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';
import 'service/theme_service.dart';
import 'theme/theme.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitService.init();
  await GetStorage.init();
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // themeMode: ThemeMode.system,
     // themeMode: ThemeService().getThemeMode(),
      themeMode: ThemeService().theme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      translations: TransLator(),
      locale: const Locale("uz","UZ"),
      fallbackLocale: const Locale('uz', "UZ"),
      debugShowCheckedModeBanner: false,
      home:const LanguagePage(),
      getPages: [
        GetPage(name: "/HomePage", page: () => const HomePage()),
        GetPage(name: "/MainPage", page: () => const MainPage()),
      ],
    );
  }
}