import 'package:get/get.dart';

import 'package:pts_2023_001/app/modules/emailVerify/bindings/email_verify_binding.dart';
import 'package:pts_2023_001/app/modules/emailVerify/views/email_verify_view.dart';
import 'package:pts_2023_001/app/modules/forgotPassword/bindings/forgot_password_binding.dart';
import 'package:pts_2023_001/app/modules/forgotPassword/views/forgot_password_view.dart';
import 'package:pts_2023_001/app/modules/home/bindings/home_binding.dart';
import 'package:pts_2023_001/app/modules/home/views/home_view.dart';
import 'package:pts_2023_001/app/modules/login/bindings/login_binding.dart';
import 'package:pts_2023_001/app/modules/login/views/login_view.dart';
import 'package:pts_2023_001/app/modules/loginPhone/bindings/login_phone_binding.dart';
import 'package:pts_2023_001/app/modules/loginPhone/views/login_phone_view.dart';
import 'package:pts_2023_001/app/modules/otpVerify/bindings/otp_verify_binding.dart';
import 'package:pts_2023_001/app/modules/otpVerify/views/otp_verify_view.dart';
import 'package:pts_2023_001/app/modules/register/bindings/register_binding.dart';
import 'package:pts_2023_001/app/modules/register/views/register_view.dart';
import 'package:pts_2023_001/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:pts_2023_001/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PHONE,
      page: () => LoginPhoneView(),
      binding: LoginPhoneBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.EMAIL_VERIFY,
      page: () => EmailVerifyView(),
      binding: EmailVerifyBinding(),
    ),
  ];
}
