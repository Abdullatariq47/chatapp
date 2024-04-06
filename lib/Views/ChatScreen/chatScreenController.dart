import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/imagecontroller.dart';
import '../../Models/message.dart';
import '../../utils/utils.dart';

class ChatScreenController {
  final TextEditingController userController = TextEditingController();
  final controller = Get.put(ImageController());
  final gemini = Gemini.instance;
  final ScrollController scrollController = ScrollController();

  List<Content> chathistory = [];

  Future<void> sendMessage() async {
    final message = userController.text;
    userController.clear();
    try {
      chathistory.add(Content(role: 'user', parts: [Parts(text: message)]));

      controller.messages.add(
          Message(isUser: true, message: message.obs, date: DateTime.now()));

      controller.messages
          .add(Message(isUser: false, message: "".obs, date: DateTime.now()));

      gemini
          .chat(chathistory,
              generationConfig: GenerationConfig(
                temperature: 0.7,
                maxOutputTokens: 500,
              ))
          .then((value) => {
                controller.messages.last.message.value += value?.output ?? "",
              });
      chathistory.add(Content(
          role: 'model',
          parts: [Parts(text: controller.messages.last.message.value)]));
    } catch (error) {
      if (kDebugMode) {
        print('Error generating content: $error');
      }
    }
  }

  Future<void> sendMessageWithPicture() async {
    final message = userController.text;
    userController.clear();

    controller.messages.add(Message(
        isUser: true,
        message: message.obs,
        date: DateTime.now(),
        imagepath: controller.imagePath.value));

    final image = await File(controller.imagePath.value);
    controller.messages
        .add(Message(isUser: false, message: "".obs, date: DateTime.now()));
    try {
      gemini
          .textAndImage(
              text: message,
              images: [image.readAsBytesSync()],
              generationConfig: GenerationConfig(
                temperature: 0.7,
                maxOutputTokens: 500,
              ))
          .then((value) => {
                controller.messages.last.message.value = value?.output ?? "",
              })
          .onError((error, stackTrace) => {
                Utils.toastMessage(error.toString() + stackTrace.toString()),
              });
    } catch (error) {
      if (kDebugMode) {
        print('Error generating content: $error');
      }
    }
  }

  Future sendQuery() async {
    if (controller.imagePath.value.isNotEmpty) {
      sendMessageWithPicture();
    } else {
      sendMessage();
    }
    gemini
        .listModels()
        .then((models) => print("XXX$models XXX"))

        /// list
        .catchError((e) => log('listModels', error: e));
  }

  void scrollDown(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      final double idealScrollOffset =
          scrollController.position.maxScrollExtent - keyboardHeight;

      if (scrollController.offset < idealScrollOffset) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }
}
