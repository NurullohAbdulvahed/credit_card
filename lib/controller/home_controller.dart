import 'package:credit_card/model/banks_model.dart';
import 'package:credit_card/service/http_service.dart';
import 'package:credit_card/service/log_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  String cardNumber = '';
  Banks? banks;
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void goToMainPage(){
    Banks banks = Banks(expiredDate: expiryDate, cardHolderName: cardHolderName, cardNumber: cardNumber, cvvCode: cvvCode,);
    Network.POST(Network.API_CREATE, Network.paramsCreate(banks))
        .then((response) {
      Log.d(response!);
     // Navigator.of(context).pop(true);
      Get.back(result: true);
    });
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    update();
  }
}