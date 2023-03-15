import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

class SiswaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = "";

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference siswa = firestore.collection("siswa");

    return await siswa.get();
  }

  addData(int NISN, String foto, String nama, String alamat,
      String tanggalLahir, String tempatLahir) async {
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
      await siswa.add(data).then((DocumentReference doc) => Get.defaultDialog(
          title: "Alert!", middleText: "Success Create Data"));
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.defaultDialog(title: "Alert!", middleText: "Failed to Create Data!!");
    }
  }

  updateData(String id, int NISN, String foto, String nama, String alamat,
      String tanggalLahir, String tempatLahir) async {
    try {
      final data2 = {
        "NISN": NISN,
        "foto": foto,
        "nama": nama,
        "alamat": alamat,
        "tanggalLahir": tanggalLahir,
        "tempatLahir": tempatLahir,
      };

      DocumentReference siswa2 = firestore.collection('siswa').doc(id);
      await siswa2.update(data2);

      Get.defaultDialog(title: 'Alert', middleText: 'Data Updated');
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'Failed to Update');
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference siswa = firestore.collection('siswa').doc(id);
      Get.defaultDialog(
          title: "Alert!",
          middleText: "Want to delete this data?",
          confirm: ElevatedButton(
              onPressed: () async {
                await siswa.delete();
                Get.offAllNamed(Routes.HOME);
              },
              child: Text("YES")),
          cancel: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: bgRed),
              onPressed: () => Get.back(),
              child: Text("NO")));
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'Failed to Delete');
      print(e);
    }
  }
}
