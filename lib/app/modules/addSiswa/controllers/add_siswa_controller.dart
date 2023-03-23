import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/siswa_controller.dart';

class AddSiswaController extends GetxController {
  //TODO: Implement AddSiswaController
  TextEditingController nisn = TextEditingController();
  TextEditingController linkFoto = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();

  RxString file = "".obs;

  uploadGambar() async {
    String data = await SiswaController().addPhoto();
    linkFoto.text = data;
    file.value = data;
    print(data);
  }

  changeTanggal(String tanggalMentah) {
    return tanggalMentah.substring(0, 10);
  }

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
