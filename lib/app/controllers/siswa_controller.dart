import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SiswaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = "";

  dataSiswa(int NISN, String foto, String nama, String alamat, String tanggalLahir,String tempatLahir) async {
    // Create a new user with a first and last name
    CollectionReference siswa = firestore.collection("siswa");
    final data = {
      "NISN": NISN,
      "foto": foto,
      "nama": nama,
      "alamat": alamat,
      "tanggalLahir": tanggalLahir,
      "tempatLahir": tempatLahir,
    };

    // Add a new document with a generated ID
    try {
      await siswa.add(data).then((DocumentReference doc) =>
          Get.defaultDialog(title: "Alert!", middleText: "berhasiel, MASBRO"));
    } catch (e) {
      Get.defaultDialog(title: "Alert!", middleText: "GAGAL, wjvwqjqwc sih");
    }
  }
   Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference siswa = firestore.collection("siswa");

    return await siswa.get();
  }
}
