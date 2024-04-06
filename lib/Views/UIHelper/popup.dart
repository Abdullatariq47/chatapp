import 'package:chatapp/Controller/imagecontroller.dart';
import 'package:chatapp/Views/UIHelper/buttonCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Popup extends StatelessWidget {
  final _controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 400.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(15.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Where you want to pick Image",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: 0.48,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                onTap: () {
                  _controller.getImageGalary();
                  Get.back();
                },
                child: ButtonCustom(textValue: "Galary")),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                _controller.getImageCameera();
                Get.back();
              },
              child: Container(
                width: 378.w,
                height: 60.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x5917C3CE),
                      blurRadius: 10,
                      offset: Offset(4, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.48,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
