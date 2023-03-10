import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/login_phone_controller.dart';

class LoginPhoneView extends GetView<LoginPhoneController> {
  final phoneC = Get.put(LoginPhoneController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: lebar,
          padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: InkWell(
                    onTap: () => Get.toNamed(Routes.LOGIN),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Login by Phone number",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: 370,
                margin: EdgeInsets.only(bottom: 50),
                child: Text(
                  "Enter the Phone number for login",
                  style: TextStyle(fontSize: 15, color: abu),
                ),
              ),
              Container(
                height: tinggi * 0.70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: TextField(
                          controller: phoneC.phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Enter Your Mobile Phone",
                              prefixIcon: Container(
                                width: lebar * 0.13,
                                child: Row(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 5, 5, 5),
                                        child: Text(
                                          "+62",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        height: tinggi * 0.04,
                                        child: VerticalDivider(
                                          color: abu,
                                          width: 2,
                                        ))
                                  ],
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    Container(
                      height: tinggi * 0.07,
                      width: lebar,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: bgLogin2),
                          onPressed: () =>
                              authC.verifyPhone(controller.phone.text),
                          child: Text(
                            "Send OTP code",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
