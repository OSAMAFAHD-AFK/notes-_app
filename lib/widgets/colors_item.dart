import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive // توجد طرق اخرى افضل لتحديد ما اذا كان العنصر مفعل ام لا
        ? CircleAvatar(
            radius: 25,
            backgroundColor: kPrimaryColor,
            child: CircleAvatar(radius: 20, backgroundColor: color),
          )
        : CircleAvatar(radius: 25, backgroundColor: color);
  }
}
