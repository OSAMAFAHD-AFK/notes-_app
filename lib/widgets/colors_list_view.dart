import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

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

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> Colors = const [
    Color(0xffFFCC80),
    Color(0xFFEBF38B),
    Color(0xFFF4E87C),
    Color(0xffCBBF7A),
    Color(0xFF9F956C),
    Color(0xFF584D3D),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      // حجم نصف قطر الدائرة,ضرب 2 من اجل ياخذ نفس حجم الدائرة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // لتقليل حجم الذاكرة المستخدمة وجعلهم في المتوسط
        itemCount: Colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  context.read<AddNoteCubit>().selectedColor =
                      Colors[index];
                });
              },
              child: ColorItem(
                color: Colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
