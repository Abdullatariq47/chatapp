import 'package:chatapp/Views/SignUp/signupController.dart';
import 'package:chatapp/Views/SignIn/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../UIHelper/buttonCustom.dart';
import '../UIHelper/checkBox.dart';
import '../UIHelper/textFiledCustom.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  double space = 30.h;

  SignupScreen({super.key});
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 50.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello there',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: 0.40,
                      ),
                    ),
                    SvgPicture.asset('assets/images/hello_icon.svg'),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Please enter you email & password to create an account ',
                    style: TextStyle(
                      color: const Color(0xFF9E9E9E),
                      fontSize: 14.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.28.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          textValue: "Your email",
                          textHint: "Enter your email",
                          iconValue: Icons.mail_outline,
                          controller: controller.emailcontroller,
                        ),
                        SizedBox(
                          height: space,
                        ),
                        TextFieldCustom(
                          textValue: "Create password",
                          textHint: "Create your password",
                          iconValue: Icons.remove_red_eye,
                          textType: "PASSWORD",
                          controller: controller.passwordController,
                        ),
                        SizedBox(
                          height: space,
                        ),
                        TextFieldCustom(
                          textValue: "Create password again",
                          textHint: "Create your password",
                          iconValue: Icons.remove_red_eye,
                          textType: "PASSWORD",
                          controller: controller.retypepasswordController,
                        ),
                      ],
                    )),
                Row(
                  children: [
                    CheckBox(isChecked: false),
                    SizedBox(
                      width: 105.w,
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                          color: const Color(0xFF3A3A3A),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.11.h,
                          letterSpacing: 0.28.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: space,
                ),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signUp();
                      }
                    },
                    child: ButtonCustom(
                      textValue: "Continue",
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Forget password?',
                  style: TextStyle(
                    color: const Color(0xFF16C3CE),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.11.h,
                    letterSpacing: 0.28.sp,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                        letterSpacing: 0.28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(SigninScreen());
                      },
                      child: Container(
                        // Increase the tappable area
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: const Color(0xFF16C3CE),
                            fontSize: 20.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.11.h,
                            letterSpacing: 0.28.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
