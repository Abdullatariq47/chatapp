import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DropMenu extends StatefulWidget {
  final String textValue;
  final String textHint;
  String? valuedata;
  Rx<TextEditingController>? controller;

  DropMenu({required this.textValue, required this.textHint, this.controller});

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textValue,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.28,
          ),
        ),
        SizedBox(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: const Color.fromRGBO(23, 195, 206, 1),
                width: 1.h,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: const Color.fromRGBO(23, 195, 206, 1),
                width: 3.h,
              )),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Select an Option';
              }
            },
            value: widget.valuedata,
            hint: Text(widget.textHint),
            items: [
              DropdownMenuItem(
                child: Text("Male"),
                value: 'Male',
              ),
              DropdownMenuItem(
                child: Text('Female'),
                value: 'Female',
              ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                widget.valuedata = newValue;
                widget.controller?.value.text = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }
}
