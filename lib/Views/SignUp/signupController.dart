import 'package:chatapp/Firebase/firebaseController.dart';
import 'package:chatapp/Views/SignIn/signinscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final retypepasswordController = TextEditingController().obs;
  late FirebaseAuthController firebaseController;

  Future<void> signUp() async {
    firebaseController = FirebaseAuthController();
    Future<bool> success = firebaseController.createUser(
        emailcontroller.value.text, passwordController.value.text);
    if (await success) {
      Get.off(SigninScreen());
    }
  }
}
