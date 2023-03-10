import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final registerC = Get.put(RegisterController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx((() => Scaffold(
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
                    height: tinggi * 0.78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 60),
                          child: Text(
                            "Create an account to access the student CRUD page",
                            style: TextStyle(fontSize: 15, color: abu),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Email address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: lebar,
                          child: TextField(
                            controller: registerC.email,
                            decoration: InputDecoration(
                                labelText: "Enter your Email",
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: abu))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: lebar,
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: registerC.password,
                            obscureText:
                                registerC.showhide.value ? false : true,
                            decoration: InputDecoration(
                                labelText: "Enter your Password",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () => registerC.changeEye(),
                                  icon: Icon(
                                    registerC.showhide.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: abu))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          height: tinggi * 0.06,
                          width: lebar,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: bgLogin2),
                              onPressed: () => authC.signUp(
                                  controller.email.text,
                                  controller.password.text),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(color: abu),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
                            style: TextStyle(color: bgLogin2),
                          ))
                    ],
                  ))
                ],
              ),
            ),
          ),
        )));
  }
}
