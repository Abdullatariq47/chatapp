import 'package:chatapp/Views/ProfileComplete/completeprofilecontroller.dart';
import 'package:chatapp/Views/UIHelper/buttonCustom.dart';
import 'package:chatapp/Views/UIHelper/dropmenu.dart';
import 'package:chatapp/Views/UIHelper/textFiledCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatelessWidget {
  double space = 20.h;
  final _controller = Get.put(CompleteProfileController());
  final _formkey = GlobalKey<FormState>();

  CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  'Complete your profile',
                  style: TextStyle(
                    color: const Color(0xFF3A3A3A),
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0.h,
                    letterSpacing: 0.40.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Please enter your details to complete your profile, don’t worry your details are private. ',
                    style: TextStyle(
                      color: const Color(0xFF9E9E9E),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.h,
                      letterSpacing: 0.28.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                Center(
                  child: SizedBox(
                    width: 150.w,
                    height: 150.h,
                    child: Stack(
                      children: [
                        Positioned(
                            child: SizedBox(
                          width: 130.w,
                          height: 130.h,
                          child:
                              SvgPicture.asset('assets/images/user_avatar.svg'),
                        )),
                        Positioned(
                          top: 100.h,
                          left: 95.w,
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF3A3A3A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SvgPicture.asset(
                                  'assets/images/edit_pen.svg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 69.h,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFieldCustom(
                        textValue: "Full Name",
                        textHint: 'Enter Full Name',
                        controller: _controller.nameController,
                      ),
                      SizedBox(
                        height: space,
                      ),
                      TextFieldCustom(
                        textValue: "Phone Number",
                        textHint: '+920000000000',
                        controller: _controller.phoneController,
                        textType: "PHONE",
                      ),
                      SizedBox(
                        height: space,
                      ),
                      DropMenu(
                        textValue: "Gender",
                        textHint: "Gender",
                        controller: _controller.genderController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _controller.adduser();
                      }
                    },
                    child: ButtonCustom(textValue: 'Continue')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
