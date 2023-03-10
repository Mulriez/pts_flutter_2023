import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:pts_2023_001/app/controllers/auth_controller.dart';
import 'package:pts_2023_001/config/warna.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  final otpC = Get.put(OtpVerifyController());
  final authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    double lebar = MediaQuery.of(context).size.width;
    double tinggi = MediaQuery.of(context).size.height;

//* <-- pinput -->
    const borderColor = Color.fromRGBO(30, 60, 87, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: TextStyle(
                  color: tam, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            Text(
              'Enter the verification code here',
              style: TextStyle(color: abu, fontSize: 14),
            ),
            SizedBox(
              height: tinggi * 0.015,
            ),
            SizedBox(
              height: tinggi * 0.06,
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Pinput(
                  onSubmitted: (pin) => authC.checkOTP(pin),
                  length: 6,
                  pinAnimationType: PinAnimationType.slide,
                  controller: TextEditingController(),
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                  onCompleted: (pin) => authC.checkOTP(pin),
                )),
            SizedBox(
              height: tinggi * 0.05,
            ),
            Container(
              width: lebar,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xff0D8173)),
                ),
                child: Text(
                  'Send code',
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
