import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBox extends StatefulWidget { // Class name should be capitalized
  bool isChecked; // Member variable name is more standard
  CheckBox({required this.isChecked}); // Pass initial value in constructor

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(
        color: Color(0xFF17C3CE),
      ),
      value: widget.isChecked,
      onChanged: (newValue) {
        setState(() {
          widget.isChecked = newValue!;
        });
      },
      activeColor: Color(0xFF17C3CE), // Filled color when checked
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return Color(0xFF17C3CE); // Filled color when checked
        }
        return Colors.white; // Default (unchecked) border color
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}