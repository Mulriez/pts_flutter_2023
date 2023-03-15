import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddSiswaController extends GetxController {
  //TODO: Implement AddSiswaController
  TextEditingController nisn = TextEditingController();
  TextEditingController linkFoto = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();

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
