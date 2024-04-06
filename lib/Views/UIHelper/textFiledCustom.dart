import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextFieldCustom extends StatefulWidget {
  final String textValue;
  final String textHint;
  IconData? iconValue;
  final String textType;
  bool ispass = false;
  bool hidepass = false;
  Rx<TextEditingController>? controller;

  TextFieldCustom(
      {super.key,
      required this.textValue,
      required this.textHint,
      this.iconValue,
      this.textType = "TEXT",
      this.controller});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  TextInputType keyboardType = TextInputType.text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  void check() {
    if (widget.textType == "PASSWORD") {
      widget.ispass = true;
      widget.hidepass = true;
    } else if (widget.textType == "PHONE") {
      keyboardType = TextInputType.phone;
    }
  }

  void chnagePassType() {
    if (widget.hidepass == false) {
      widget.hidepass = true;
    } else {
      widget.hidepass = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textValue,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.28,
            ),
          ),
          SizedBox(
            //height: 60.h,
            width: Get.width.w,
            child: TextFormField(
              keyboardType: keyboardType,
              controller: widget.controller?.value,
              obscureText: widget.hidepass,
              decoration: InputDecoration(
                hintText: widget.textHint,
                suffixIcon: widget.ispass
                    ? widget.hidepass
                        ? IconButton(
                            icon: Icon(widget.iconValue),
                            onPressed: () {
                              widget.hidepass = false;
                              setState(() {});
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              widget.hidepass = true;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility_off),
                          )
                    : Icon(widget.iconValue),
                suffixIconColor: const Color(0xFFC9C9C9),
                hintStyle: const TextStyle(
                  color: Color(0xFFC9C9C9),
                ),
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
                  return 'Please Enter the Field';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
