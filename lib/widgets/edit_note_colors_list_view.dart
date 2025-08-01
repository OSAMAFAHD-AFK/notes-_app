import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_item.dart';

class EditNoteCokorsList extends StatefulWidget {
  const EditNoteCokorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteCokorsList> createState() =>
      _EditNoteCokorsListState();
}

class _EditNoteCokorsListState extends State<EditNoteCokorsList> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      // حجم نصف قطر الدائرة,ضرب 2 من اجل ياخذ نفس حجم الدائرة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // لتقليل حجم الذاكرة المستخدمة وجعلهم في المتوسط
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.note.color = kColors[index].value;
                });
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
