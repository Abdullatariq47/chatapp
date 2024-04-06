import 'package:chatapp/Views/SignIn/signincontroller.dart';
import 'package:chatapp/Views/UIHelper/buttonCustom.dart';
import 'package:chatapp/Views/UIHelper/checkBox.dart';
import 'package:chatapp/Views/UIHelper/textFiledCustom.dart';
import 'package:chatapp/Views/SignUp/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SigninController());
  double space = 30.h;

  SigninScreen({super.key});

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
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.h,
                        letterSpacing: 0.40.sp,
                      ),
                    ),
                    SvgPicture.asset('assets/images/hello_icon.svg'),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    'Please enter you email & password to sign in',
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
                  height: 60.h,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          textValue: "Email",
                          textHint: "Email",
                          iconValue: Icons.mail_outline,
                          controller: controller.emailcontroller,
                        ),
                        SizedBox(
                          height: space,
                        ),
                        TextFieldCustom(
                          textValue: "Password",
                          textHint: "Password",
                          iconValue: Icons.remove_red_eye,
                          textType: 'PASSWORD',
                          controller: controller.passwordController,
                        ),
                      ],
                    )),
                SizedBox(
                  height: space,
                ),
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
                      controller.signIn();
                    }
                  },
                  child: ButtonCustom(
                    textValue: "Sign In",
                  ),
                ),
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
                  height: space,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.11.h,
                        letterSpacing: 0.28.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(SignupScreen());
                      },
                      child: Container(
                        // Increase the tappable area
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Sign up',
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
