import 'package:credit_card/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  static const String id = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Text("add_your_card".tr,style: const TextStyle(),),

      ),

      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) => SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            Text("fill_in_fields".tr),
                          ],
                        ),
                        padding: const EdgeInsets.only(left: 20),
                      ),
                      CreditCardForm(

                          cardNumber: controller.cardNumber,
                          ///CardNumberDecoration
                          cardNumberDecoration: InputDecoration(
                              hintMaxLines: 16,
                              labelText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Image.asset(
                                    "assets/images/mastercard.png",
                                    width: 30,
                                    height: 30,
                                  ))),
                          expiryDate: controller.expiryDate,

                          ///ExpiryDecoration
                          expiryDateDecoration:  InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),

                          ///cardHolderDecoration

                          cardHolderDecoration:  InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            labelText: 'Card Holder',
                          ),
                          cardHolderName: controller.cardHolderName,


                          ///CVVCodeDecoration
                          cvvCodeDecoration:  InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cvvCode: controller.cvvCode,

                          onCreditCardModelChange: controller.onCreditCardModelChange,
                          themeColor: Colors.blue,
                          formKey: controller.formKey),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: const Color(0xff1b447b),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          child:  Text(
                            'validate'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Get.defaultDialog(
                          //   title: "Add your card",
                          //   middleText: "Do you want add your card?",
                          //  textConfirm: "Confirm",
                          //   onConfirm: () {
                          //     GestureDetector(
                          //       onTap: controller.goToMainPage,
                          //     );
                          //   },
                          //   onCancel: () => Get.back(),
                          //  cancel: const Text("Cancel",style: TextStyle(color: Colors.blue),),
                          //  confirm: const Text("Confirm",style: TextStyle(color: Colors.red),),
                          //   textCancel: "Cancel"
                          // );
                          controller.goToMainPage();
                          controller.update();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

