import 'dart:async';
import 'package:chatapp/Firebase/fireStoreController.dart';
import 'package:chatapp/Firebase/firebaseController.dart';
import 'package:chatapp/Views/ChatScreen/chatScreen.dart';
import 'package:chatapp/Views/ProfileComplete/completeProfile.dart';
import 'package:chatapp/Views/Home/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../SignIn/signinscreen.dart';

class splashScreenController {
  late FirebaseAuthController firebaseController;
  late FireStoreController firestore;

  Future<void> checkLogin() async {
    firestore = FireStoreController();
    firebaseController = FirebaseAuthController();
    Future<bool> result = firebaseController.checkUser();
    if (await result) {
      result = firestore.chechUserProfile();
      if (await result) {
        Get.off(Home());
      } else {
        Get.off(CompleteProfile());
      }
    } else {
      Get.off(SigninScreen());
    }
  }
}
