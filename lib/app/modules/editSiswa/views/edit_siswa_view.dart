import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/siswa_controller.dart';
import 'package:pts_2023_001/app/modules/home/controllers/home_controller.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/edit_siswa_controller.dart';

class Tanggal extends GetxController {
  var selectedDate = DateTime.now().obs;

  void onDateSelected(DateTime newDate) {
    selectedDate.value = newDate;
  }
}

class EditSiswaView extends GetView<EditSiswaController> {
  final siswaC = Get.put(SiswaController());
  final homeC = Get.put(HomeController());
  final data = Get.arguments;
  final tanggal = Get.put(Tanggal());
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Data'),
          centerTitle: true,
          backgroundColor: bgLogin,
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bgLogin,
                        ),
                        onPressed: () => controller.uploadGambar(),
                        child: Text(
                          "Upload Photo",
                          style: TextStyle(color: tam),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomInput(
                        keyboardType: TextInputType.number,
                        controller: controller.nisn,
                        label: 'NISN',
                        hint: 'Enter NISN',
                        obscure: false),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomInput(
                        // keyboardType: TextInputType.text,
                        controller: controller.nama,
                        label: 'Name',
                        hint: 'Enter Name',
                        obscure: false),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomInput(
                        // keyboardType: TextInputType.text,
                        controller: controller.alamat,
                        label: 'Address',
                        hint: 'Enter Address',
                        obscure: false),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Date of Birth",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        TextFormField(
                          controller: controller.tanggalLahir,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 19,
                            ),
                            hintText: "Date of Birth",
                            hintStyle: TextStyle(
                                fontFamily: "Poppins",
                                color: abu,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: tam, width: 1),
                              gapPadding: 5,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 27, 27, 27),
                                  width: 1),
                              gapPadding: 5,
                            ),
                          ),
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: tanggal.selectedDate.value,
                              firstDate: DateTime(1980),
                              lastDate: DateTime(2030),
                            ).then((newDate) {
                              if (newDate != null) {
                                tanggal.onDateSelected(newDate);
                                controller.tanggalLahir.text = tanggal
                                    .selectedDate.value
                                    .toString()
                                    .substring(0, 10);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CustomInput(
                        // keyboardType: TextInputType.text,
                        controller: controller.tempatLahir,
                        label: 'Place of birth',
                        hint: 'Enter Place of birth',
                        obscure: false),
                  ),
                ],
              )),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              margin: EdgeInsets.only(top: 40),
              child: InkWell(
                  onTap: () {
                    siswaC.updateData(
                        data?.id,
                        int.parse(controller.nisn.text),
                        controller.linkFoto.text,
                        controller.nama.text,
                        controller.alamat.text,
                        controller.changeTanggal(
                          controller.tanggalLahir.text,
                        ),
                        controller.tempatLahir.text);
                  },
                  child: Container(
                      width: lebar,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: bgLogin,
                          border: Border.all(color: tam, width: 2)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Update Data',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500))
                          ]))))
        ]))));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon, keyboardType}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: abu,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: tam, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}
