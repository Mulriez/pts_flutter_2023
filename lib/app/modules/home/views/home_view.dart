import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/controllers/siswa_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';
import 'package:lottie/lottie.dart';

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
          child: Column(children: [
            Container(
                height: tinggi * 0.12,
                decoration: BoxDecoration(color: bgLogin),
                padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: lebar * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => authC.logout(),
                            child: Icon(
                              Icons.logout_outlined,
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
                builder: (
                  context,
                  snapshot,
                ) {
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
                            delete: (dataSiswa[index].id),
                            arguments: dataSiswa[index]);
                      })),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 300),
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.ADD_SISWA),
          child: Icon(Icons.add),
        ));
  }
}

Widget card(
    {NISN, foto, nama, alamat, tanggalLahir, tempatLahir, delete, arguments}) {
  final siswaC = Get.put(SiswaController());
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: 350,
    height: 180,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: bgLogin),
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
                image: DecorationImage(
                    image: NetworkImage(foto), fit: BoxFit.cover)),
          )
        ],
      ),
      Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "NISN:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      NISN,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      nama,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Address:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      alamat,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Date of Birth:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      tanggalLahir,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Place of Birth:",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Text(
                      tempatLahir,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 33),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      margin: EdgeInsets.only(right: 25),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () => Get.toNamed(Routes.EDIT_SISWA,
                              arguments: arguments),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mode_edit_outline_outlined,
                                size: 20,
                                // color: tam,
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 80,
                      height: 30,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () => siswaC.deleteData(delete),
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
