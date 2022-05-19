import 'package:credit_card/model/banks_model.dart';
import 'package:credit_card/pages/home_page.dart';
import 'package:credit_card/service/http_service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{
  List<Banks> bankList = [];
  bool isLoading = false;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    apiPostList();
  }

  void apiPostList() async{
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      _showResponse(response);
    }
  }
  void apiDelete(int id)async{
    isLoading = true;
    update();
    var response = await Network.DEL(Network.API_DELETE+id.toString(), Network.paramsEmpty());
    if(response != null){
      _resPostDelete(response);
    }
  }

  void _resPostDelete(String response){
    isLoading = false;
    update();
    apiPostList();
    update();
  }

  void _showResponse(String response) {
    List<Banks> list = Network.parsePostList(response);
    bankList = list;
    isLoading = false;
    update();
  }
  goToNextPage(){
  Get.to(const HomePage());
  }

}