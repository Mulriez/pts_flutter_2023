import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pts_2023_001/app/routes/app_pages.dart';
import 'package:pts_2023_001/config/warna.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String codeVerification = '';

  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(title: "Alert!", middleText: "User doesn't exist");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(title: "Alert!", middleText: "Your password invalid");
      }
    } catch (e) {
      if (emailAddress == null && password == null) {
        Get.defaultDialog(title: "Alert!", middleText: "Fields are null!");
      }
    }
  }

  logout() {
    print("Telah Log out");
    Get.defaultDialog(
        title: "Alert!",
        middleText: "Wanna Logout?",
        confirm: ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text("YES")),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: bgRed),
            onPressed: () => Get.back(),
            child: Text("NO")));
  }

  signUp(String emailAddress, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      Get.toNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(title: "Alert!", middleText: "Email already in use!");
      }
    } catch (e) {
      print(e);
    }
  }

 resetPassword(String email) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: email);
      Get.offAllNamed(Routes.EMAIL_VERIFY);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'No user found for that email.',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Get.offAllNamed(Routes.HOME);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  verifyPhone(String nomor) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+62${nomor}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Get.offAllNamed(Routes.HOME);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'failed to send verification code',
          backgroundColor: Colors.red,
          titleStyle: TextStyle(color: Colors.white),
          middleTextStyle: TextStyle(color: Colors.white),
        );
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        codeVerification = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        codeVerification = verificationId;
      },
      timeout: Duration(seconds: 60),
    );
    Get.offAllNamed(Routes.OTP_VERIFY, parameters: {'phone': nomor});
  }

  checkOTP(String smsCode) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: codeVerification, smsCode: smsCode))
          .then((value) {
        if (value.user != null) {
          Get.offAllNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.defaultDialog(
        title: "Error!",
        middleText: 'gagal mengirim kode OTP',
        backgroundColor: Colors.red,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }
}
