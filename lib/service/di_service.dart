import 'package:credit_card/controller/detail_controller.dart';
import 'package:credit_card/controller/home_controller.dart';
import 'package:get/get.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);


  }
}