import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCustom extends StatelessWidget{

  final String textValue;

  ButtonCustom({required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378.w,
      height: 60.h,
      decoration: ShapeDecoration(
        color: Color(0xFF16C3CE),
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
          textValue,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.48,
          ),
        ),
      ),
    );
  }

}