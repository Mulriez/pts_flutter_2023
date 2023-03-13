import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final forgotC = Get.put(ForgotPasswordController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SafeArea(
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
                ),
              ),
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                  color: tam, fontSize: 26, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              'Enter the email associated with your account and we’ll send an email with instructions to reset your password.',
              style: TextStyle(color: abu, fontSize: 14),
            ),
            SizedBox(
              height: tinggi * 0.045,
            ),
            Text(
              'Email Address',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: tam),
            ),
            SizedBox(
              height: tinggi * 0.012,
            ),
            Container(
              width: lebar,
              height: 50,
              child: TextField(
                controller: controller.email,
                cursorColor: tam,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(
                    color: abu,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: abu),
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: abu),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
            SizedBox(
              height: tinggi * 0.04,
            ),
            Container(
              width: lebar,
              height: 50,
              child: ElevatedButton(
                onPressed: () => authC.resetPassword(controller.email.text),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D8173)),
                ),
                child: Text(
                  'Send Instructions',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
