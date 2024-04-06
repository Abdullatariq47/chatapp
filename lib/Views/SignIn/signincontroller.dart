import 'package:chatapp/Firebase/firebaseController.dart';
import 'package:chatapp/Views/ProfileComplete/completeProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  late FirebaseAuthController firebaseController;

  Future<void> signIn() async {
    firebaseController = FirebaseAuthController();
    Future<bool> results = firebaseController.login(
        emailcontroller.value.text, passwordController.value.text);
    if (await results) {
      Get.off(CompleteProfile());
    }
  }
}
