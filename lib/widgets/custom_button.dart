import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.title = 'Save'});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(
        context,
      ).size.width, // هذا يضمن أن الزر يأخذ عرض الشاشة بالكامل
      height: 50,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
