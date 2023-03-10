import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final loginC = Get.put(LoginController());
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
                    height: tinggi * 0.86,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Hi, Welcome👋",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 70),
                          child: Text(
                            "Login to access the student CRUD page",
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
                            controller: loginC.email,
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
                          margin: EdgeInsets.only(bottom: 2),
                          child: TextField(
                            controller: loginC.password,
                            obscureText:
                                loginC.showhide.value ? false : true,
                            decoration: InputDecoration(
                                labelText: "Enter your Password",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () => loginC.changeEye(),
                                  icon: Icon(
                                    loginC.showhide.value
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
                          alignment: Alignment.topRight,
                          width: lebar,
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextButton(
                            onPressed: () => Get.toNamed(Routes.HOME),
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                  color: abu,
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Container(
                          height: tinggi * 0.06,
                          width: lebar,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: bgLogin2),
                              onPressed: () => authC.login(
                                  controller.email.text,
                                  controller.password.text),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: lebar * 0.2,
                                child: Divider(
                                  color: abu,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Or Login With",
                                  style: TextStyle(color: abu, fontSize: 10),
                                ),
                              ),
                              Container(
                                width: lebar * 0.2,
                                child: Divider(
                                  color: abu,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: lebar * 0.35,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () =>
                                      Get.toNamed(Routes.LOGIN_PHONE),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.phone_android_rounded,
                                        color: tam,
                                      ),
                                      Text(
                                        "Phone",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: lebar * 0.35,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () => authC.signInWithGoogle(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/dll/Google.png"),
                                      Text(
                                        "Google",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
                          "Don't have an account?",
                          style: TextStyle(color: abu),
                        ),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            "Sign up",
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
