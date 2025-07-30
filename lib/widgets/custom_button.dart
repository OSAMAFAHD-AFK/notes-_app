import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title = 'Save',
    this.onTap,
    this.isLoding = false,
  });
  final String title;
  final void Function()? onTap;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(
          context,
        ).size.width, // هذا يضمن أن الزر يأخذ عرض الشاشة بالكامل
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: isLoding
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
