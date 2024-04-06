import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class chatWidget extends StatefulWidget {
  final bool isUser;
  RxString message;
  final String date;
  String? imagepath;

  chatWidget(
      {required this.isUser,
      required this.message,
      required this.date,
      this.imagepath = ""});

  @override
  State<chatWidget> createState() => _chatWidgetState();
}

class _chatWidgetState extends State<chatWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        margin: const EdgeInsets.symmetric().copyWith(
          left: widget.isUser ? 70 : 10,
          right: widget.isUser ? 10 : 70,
        ),
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
        child: widget.imagepath!.length > 1
            ? Column(
                children: [
                  Container(
                      height: 300.h,
                      child: Image(
                          image: FileImage(File(widget.imagepath.toString())))),
                  Text(
                    widget.message.value,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      height: 1.5.h,
                    ),
                  )
                ],
              )
            : Obx(() => Text(
                  widget.message.value,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    height: 1.5.h,
                  ),
                )),
      ),
    );
  }
}
