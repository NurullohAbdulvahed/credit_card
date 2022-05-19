// import 'package:credit_card/language/english_language.dart';
// import 'package:credit_card/language/russian_language.dart';
// import 'package:credit_card/language/uzbek_language.dart';
// import 'package:credit_card/service/log_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class TransLator extends Translations {
//   @override
//   Map<String, Map<String, String>> get keys => {
//     'en_US': engUs, // lang/en_us.dart
//     'ru_RU': rusRus, // lang/ru_ru.dart
//     'uz_UZ': uzUzb, // lang/uz_uz.dart
//   };
//
//   static const fallbackLocale = Locale('en', 'US');
//
//   static final items = [
//     'English',
//     'Русский',
//     'O\'zbekcha',
//   ];
//
//   static final langs = [
//     'en',
//     'ru',
//     'uz',
//   ];
//
//   static final List<Locale> locales = [
//     const Locale('en', 'US'),
//     const Locale('ru', 'RU'),
//     const Locale('uz', 'UZ'),
//   ];
//
//   static final locale = defLanguage(TransLator.langs[0]);
//
//   String defaultLanguage() {
//     final locale = Get.locale;
//     var lan = locale.toString();
//     if(lan == "ru_RU") return langs[1];
//     if(lan == "uz_UZ") return langs[2];
//     return langs[0];
//   }
//
//   static Locale defLanguage(String code) {
//     var index = langs.indexOf(code);
//     return locales[index];
//   }
//
//   static changeLocale(String lang) {
//     Log.d(lang.toString());
//     final locale = _getLocaleFromLanguage(lang);
//     if(locale != null) {
//       Get.updateLocale(locale);
//     }
//   }
//
//   static Locale? _getLocaleFromLanguage(String lang) {
//     for(int i = 0; i < langs.length; i++) {
//       if(lang == langs[i]) return locales[i];
//     }
//     return Get.deviceLocale;
//   }
// }
import 'package:credit_card/language/english_language.dart';
import 'package:credit_card/language/russian_language.dart';
import 'package:credit_card/language/uzbek_language.dart';
import 'package:credit_card/service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransLator extends Translations {
 // static final Langs = ["O`zbek","Русский","English"];
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US" :engUs,
    "ru_RU" :rusRus,
    "uz_UZ" :uzUzb,
  };
  static final locales = [
    const Locale("uz","UZ"),
    const Locale("ru","RU"),
    const Locale("en","US")
  ];

  static final langs = [
    'uz',
    'ru',
    'en',

  ];

  static final locale = defLanguage(DBService.to.getData<String>(StorageKeys.language) ?? TransLator.langs[0]);

  String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if(lan == "ru_RU") return langs[1];
    if(lan == "en_US") return langs[2];
    return langs[0];
  }


  static changeLocale(String lang){
    final locale = _getLocaleFromLanguages(lang);
    Get.updateLocale(locale);
    DBService.to.setData<String>(StorageKeys.language, lang);
  }
  static Locale defLanguage(String code) {
    int index = langs.indexOf(code);
    return locales[index];
  }

  static Locale _getLocaleFromLanguages(String lang){
    for(int i = 0; i<langs.length;i++){
      if(lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale!;
  }
}