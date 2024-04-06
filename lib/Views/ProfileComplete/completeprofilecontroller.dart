import 'package:chatapp/Firebase/fireStoreController.dart';
import 'package:chatapp/Views/ChatScreen/chatScreen.dart';
import 'package:chatapp/Views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final genderController = TextEditingController().obs;

  late FireStoreController fireStoreController;

  Future<void> adduser() async {
    fireStoreController = FireStoreController();
    Future<bool> result = fireStoreController.updateUserDetails(
        nameController.value.text,
        phoneController.value.text,
        genderController.value.text);
    if (await result) {
      Get.off(Home());
    }
  }
}
