import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/email_verify_controller.dart';

class EmailVerifyView extends GetView<EmailVerifyController> {
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 65),
                      child: Image.asset('assets/dll/Group 2.png'),
                    ),
                    Container(
                      child: Text(
                        "Check Your Email",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: lebar * 0.70,
                      child: Text(
                        "We have sent a password recover instructions to your email.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: abu),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 90, bottom: 10),
                      width: lebar * 0.45,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          await LaunchApp.openApp(
                            androidPackageName: 'com.google.android.gm',
                            iosUrlScheme: 'googlegmail://',
                            appStoreLink:
                                'itms-apps://apps.apple.com/us/app/gmail-email-by-google/id422689480',
                            openStore: true,
                          );
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff0D8173)),
                        ),
                        child: Text(
                          'Open Email App',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                          onPressed: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Skip, I'll confirm later",
                            style: TextStyle(
                                color: abu,
                                decoration: TextDecoration.underline),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}