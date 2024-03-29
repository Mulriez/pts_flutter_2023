import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/siswa_controller.dart';

class EditSiswaController extends GetxController {
  //TODO: Implement EditSiswaController
  final data = Get.arguments;


  TextEditingController nisn = TextEditingController();
  TextEditingController linkFoto = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();

  changeTanggal(String tanggalMentah) {
    return tanggalMentah.substring(0, 10);
  }

  uploadGambar() async{
    String data = await SiswaController().addPhoto();
    linkFoto.text = data;
    print(data);
  }

  final count = 0.obs;
  @override
  void onInit() {
    nisn.text = (data.data() as Map<String, dynamic>)['NISN'].toString();
    linkFoto.text = (data.data() as Map<String, dynamic>)['foto'];
    nama.text = (data.data() as Map<String, dynamic>)['nama'];
    alamat.text = (data.data() as Map<String, dynamic>)['alamat'];
    tanggalLahir.text = (data.data() as Map<String, dynamic>)['tanggalLahir'];
    tempatLahir.text = (data.data() as Map<String, dynamic>)['tempatLahir'];
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
