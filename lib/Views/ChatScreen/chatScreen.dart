import 'dart:io';
import 'package:chatapp/Controller/imagecontroller.dart';
import 'package:chatapp/Views/ChatScreen/chatScreenController.dart';
import 'package:chatapp/Views/UIHelper/chatWidget.dart';
import 'package:chatapp/Views/UIHelper/popup.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Models/message.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatscreenController = ChatScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot AI"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF212121),
          fontSize: 24.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: chatscreenController.controller.messages.length <= 0
                    ? Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 143.h,
                              width: 148.w,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/chat_logo.png')),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: 158.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/chat_bot_ai.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Obx(
                        () => Container(
                          //height: Get.height - 200.h,
                          child: ListView.builder(
                            reverse: false,
                            controller: chatscreenController.scrollController,
                            itemCount:
                                chatscreenController.controller.messages.length,
                            itemBuilder: (context, index) {
                              final message = chatscreenController
                                  .controller.messages[index];
                              return chatWidget(
                                isUser: message.isUser,
                                message: message.message,
                                date: '',
                                imagepath: message.imagepath,
                              );
                            },
                          ),
                        ),
                      ),
              ),
              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 310.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3FD4C0C0),
                            blurRadius: 7.53,
                            offset: Offset(3.77, 3.77),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.blueAccent,
                                  hintText: 'Ask me anything...',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9E9E9E),
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                minLines: 1,
                                maxLines: 5,
                                //expands: true,
                                controller: chatscreenController.userController,
                              ),
                            ),
                            SizedBox(width: 10), // Spacing between elements
                            InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                        child: Popup(),
                                      )),
                              child: Obx(
                                () => Container(
                                  // Control image size
                                  //width: 30.w,
                                  height: chatscreenController
                                          .controller.imagePath.value.isNotEmpty
                                      ? 70.h
                                      : 30.h,
                                  child: chatscreenController
                                          .controller.imagePath.value.isNotEmpty
                                      ? Stack(
                                          children: [
                                            Image(
                                                image: FileImage(File(
                                                    chatscreenController
                                                        .controller
                                                        .imagePath
                                                        .value))),
                                            Positioned(
                                                top: 1.h,
                                                right: 0.w,
                                                child: InkWell(
                                                    onTap: () {
                                                      chatscreenController
                                                          .controller
                                                          .imagePath
                                                          .value = "";
                                                    },
                                                    child: Container(
                                                        height: 20.h,
                                                        child: SvgPicture.asset(
                                                            'assets/images/cross.svg')))),
                                          ],
                                        )
                                      : SvgPicture.asset(
                                          'assets/images/Scan.svg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (chatscreenController
                                .userController.text.isNotEmpty &&
                            chatscreenController.userController.text != "") {
                          chatscreenController.sendQuery();
                          chatscreenController.scrollDown(context);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 55.h,
                        width: 55.w,
                        decoration: ShapeDecoration(
                          color: Color(0xFF16C3CE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.24),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x5917C3CE),
                              blurRadius: 12,
                              offset: Offset(3, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/images/send.svg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
