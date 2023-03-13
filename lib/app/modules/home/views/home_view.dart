import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/controllers/siswa_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.put(AuthController());
  final siswaC = Get.put(SiswaController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(children: [
      Container(
          height: tinggi * 0.12,
          decoration: BoxDecoration(color: bgLogin),
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: lebar * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => authC.logout(),
                      child: Icon(
                        CupertinoIcons.line_horizontal_3,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      FutureBuilder<QuerySnapshot<Object?>>(
          future: siswaC.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var dataSiswa = snapshot.data!.docs;
              return Container(
                child: Wrap(
                    children: List.generate(dataSiswa.length, (index) {
                  return card(
                    foto: (dataSiswa[index].data()
                        as Map<String, dynamic>)["foto"],
                    NISN: (dataSiswa[index].data()
                            as Map<String, dynamic>)["NISN"]
                        .toString(),
                    nama: (dataSiswa[index].data()
                        as Map<String, dynamic>)["nama"],
                    alamat: (dataSiswa[index].data()
                        as Map<String, dynamic>)["alamat"],
                    tanggalLahir: (dataSiswa[index].data()
                        as Map<String, dynamic>)["tanggalLahir"],
                    tempatLahir: (dataSiswa[index].data()
                        as Map<String, dynamic>)["tempatLahir"],
                  );
                })),
              );
            } else {
              return SizedBox();
            }
          })
    ]))));
  }
}

Widget card({NISN, foto, nama, alamat, tanggalLahir, tempatLahir}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: 340,
    height: 180,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.cyan),
    child: Row(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 110,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(foto))),
          )
        ],
      ),
      Container(
          padding: EdgeInsets.fromLTRB(5, 20, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "NISN:",
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      NISN,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Nama:",
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      nama,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Alamat:",
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      alamat,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Tanggal Lahir:",
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      tanggalLahir,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Tempat Lahir:",
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      tempatLahir,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      margin: EdgeInsets.only(right: 20),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () => Get.toNamed(Routes.LOGIN_PHONE),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mode_edit_outline_outlined,
                                size: 20,
                                color: tam,
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      margin: EdgeInsets.only(right: 20),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () => Get.toNamed(Routes.LOGIN_PHONE),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                size: 20,
                                color: bgRed,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          )),
    ]),
  );
}
