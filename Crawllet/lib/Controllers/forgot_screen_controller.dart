// ignore_for_file: file_names

import 'package:get/get.dart';

class ForgotScreenController extends GetxController{
    RxBool isLoadingStarted = false.obs;

  changeIsLoadingStarted(bool val) {
    isLoadingStarted.value = val;
  }

}