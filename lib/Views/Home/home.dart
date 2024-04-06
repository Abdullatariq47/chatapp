import 'package:chatapp/Views/Home/homeController.dart';
import 'package:chatapp/Views/UIHelper/buttonCustom.dart';
import 'package:chatapp/Views/ChatScreen/chatScreen.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(25.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(
                'Welcome to\nChatbot AI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF16C3CE),
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // Removed the 'height' property
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Image(image: AssetImage('assets/images/chat_logo.png')),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 158.w,
                height: 55.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/chat_bot_ai.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
              InkWell(
                  onTap: () {
                    controller
                        .geminiInit()
                        .then((value) => {
                              Get.to(ChatScreen()),
                            })
                        .onError((error, stackTrace) => {
                              Utils.toastMessage(error.toString()),
                            });
                  },
                  child: ButtonCustom(textValue: 'Start Chat')),
            ],
          ),
        ),
      ),
    );
  }
}
