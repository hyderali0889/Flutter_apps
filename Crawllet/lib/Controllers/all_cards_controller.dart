import 'package:get/get.dart';

class AllCardsController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DateTime> date = DateTime.now().obs;
  changeisloading(bool vrar) {
    isLoading.value = vrar;
  }

  addDate(DateTime dat) {
    date.value = dat;
  }


}
