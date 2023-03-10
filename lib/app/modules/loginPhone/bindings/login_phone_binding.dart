import 'package:get/get.dart';

import '../controllers/login_phone_controller.dart';

class LoginPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPhoneController>(
      () => LoginPhoneController(),
    );
  }
}
