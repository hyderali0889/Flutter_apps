import 'package:get/get.dart';

class FirebaseController extends GetxController {
  RxInt num = 1.obs;

  addADigit() {
    num++;
  }
}
