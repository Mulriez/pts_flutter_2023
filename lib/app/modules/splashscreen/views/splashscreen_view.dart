import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';
import 'package:lottie/lottie.dart';


import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: tinggi,
        padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bgLogin, bgLogin])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: tinggi * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: lebar,
                      height: tinggi * 0.3,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_omn51ec8.json")),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: 200,
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 90),
                    width: 260,
                    child: Text(
                      "Access all student data from this school application safely and easily",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    height: tinggi * 0.06,
                    width: lebar,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Color(0xFF0D8173),
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
