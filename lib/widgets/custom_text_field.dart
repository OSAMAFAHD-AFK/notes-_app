import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.title,
    this.onsaved,
  });
  final int maxLines;
  final String title;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(fontSize: 24, color: kPrimaryColor),
        border: Buildborder(color: kPrimaryColor),
        enabledBorder: Buildborder(color: kPrimaryColor),
        focusedBorder: Buildborder(color: kPrimaryColor),
      ),
    );
  }
}

OutlineInputBorder Buildborder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
