import 'package:get/get.dart';
import 'package:untitled1/Utils/routs_utils.dart';

class MapMenuController extends GetxController{

  void goToPage({required int id}) async{

    switch(id){
      case 0:{
        Get.toNamed(NameRouts.profile);
        break;
      }
      case 1:{
        break;
      }
      case 2:{
        Get.toNamed(NameRouts.history);
        break;
      }
      case 3:{
        Get.toNamed(NameRouts.incomes);
        break;
      }
      case 4:{
        break;
      }
      case 5:{
        break;
      }
      case 6:{
        break;
      }
      case 7:{
        break;
      }
      case 8:{
        break;
      }
      default:{
        break;
      }
    }
  }



}