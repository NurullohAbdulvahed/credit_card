import 'package:credit_card/controller/detail_controller.dart';
import 'package:credit_card/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  static const String id = "MainPage";

  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
        builder: (DetailController controller) => Scaffold(

          ///APPBar
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "good_morning".tr,
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/images/bella.jpg"),
                ),
              ),
              IconButton(
                  onPressed: () {
                  ThemeService().switchTheme();

                  //  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  },
                  icon:const Icon(
                    Icons.wb_sunny,
                    //controller.isDark ?   controller.darkIcon : controller.lightIcon,
                  )),
            ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                ///Create New Card
                controller.bankList.isNotEmpty
                    ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.bankList.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: ValueKey(controller.bankList[index]),
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(onDismissed: () {
                            int _id =
                            int.parse(controller.bankList[index].id!);
                            controller.apiDelete(_id);
                            controller.bankList.removeAt(index);
                            controller.update();
                          }),
                          motion: const ScrollMotion(),
                          children: const [],
                        ),
                        child: Column(
                          children: [
                            CreditCardWidget(
                                cardNumber:
                                controller.bankList[index].cardNumber ??
                                    "",
                                expiryDate:
                                controller.bankList[index].expiredDate ??
                                    "",
                                cardHolderName: controller
                                    .bankList[index].cardHolderName ??
                                    "",
                                cvvCode:
                                controller.bankList[index].cvvCode ?? "",
                                labelCardHolder: ("CARD HOLDER"),
                                labelExpiredDate: 'MM/YY',
                                showBackView: false,
                                isHolderNameVisible: true,
                                isSwipeGestureEnabled: true,
                                cardBgColor: const Color(0xff1b447b),
                                //cardType: CardType.visa,
                                customCardTypeIcons: const <
                                    CustomCardTypeIcon>[
                                  // CustomCardTypeIcon(
                                  //   cardType: CardType.visa,
                                  //
                                  // ),
                                ],
                                onCreditCardWidgetChange:
                                    (CreditCardBrand creditCardBrand) {}),
                          ],
                        ),
                      );
                    })
                    : const SizedBox.shrink(),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.center_focus_strong,color: Colors.black,),
                        onPressed: () async {
                          var result = await Get.to(const HomePage());
                          if (result == true) {
                            controller.apiPostList();
                            controller.update();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "add_your_card".tr,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color.fromRGBO(17, 17, 17, 1)
                        ),
                      )
                    ],
                  ),
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                ),
              ],
            ),
          )
        )
    );
  }
}
