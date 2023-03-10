import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  //TODO: Implement OtpVerifyController
  TextEditingController otp = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
