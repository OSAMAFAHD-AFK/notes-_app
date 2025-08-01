import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.title,
    this.initialValue,
    this.onsaved,
    this.onChanged,
  });
  final int maxLines;
  final String title;
  final String? initialValue;
  final void Function(String?)? onsaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged, // كل مرة يتم فيها تغيير النص
      onSaved: onsaved, // مرة واحدة
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      initialValue: initialValue,
      //  القيمة الافتراضية للنص داخل حقل الإدخال.
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
