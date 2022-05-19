import 'package:credit_card/controller/language_page_controller.dart';
import 'package:credit_card/language/language.dart';
import 'package:credit_card/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (LanguageController controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              ///
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   ///Select Uzbek language
                   materialButton(text: "O`zbek",lang: 'uz', fontFamily: "Poppins-Regular"),
                   const SizedBox(height: 10,),

                   ///Select Russian language
                   materialButton(text:"Русский",lang: "ru",fontFamily: "Poppins-Regular"),
                   const SizedBox(height: 10,),

                   ///Select English language
                   materialButton(text:"English",lang: "en",fontFamily: "Poppins-Regular",),
                 ],
              ),
              
              const SizedBox(height: 96,),

              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.consectetur adipiscing elit.",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFADB0B9),fontFamily: "Poppins-Regular"),),

              const SizedBox(height: 14,),
              
            ],
          ),
        )
      ),
    );
  }
  Widget materialButton({required String text,required String lang,required String fontFamily}){
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: () {
        TransLator.changeLocale(lang);
        Get.to(const MainPage());
      },
      color: const Color.fromRGBO(234, 234, 234, 1),
      height: 50,
      minWidth: double.infinity,
      child:  Text(text,style:  TextStyle(color: const Color(0xFF171616),fontFamily: fontFamily)),
    );
  }
}