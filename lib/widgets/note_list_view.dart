import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final List<Color> calmMutedColors = const [
    Color(0xffFFCC80),
    Color(0xFF80CBC4),
    Color(0xFFBCAAA4),
    Color(0xffFFCC80),
    Color(0xFF90A4AE),
    Color(0xFFDDBEA9),
    Color(0xFFFFAB91),
    Color(0xFFE6EE9C),
    Color(0xFF4E5D6A),
    Color(0xFFCE93D8),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final color =
              calmMutedColors[index % calmMutedColors.length];
          // لتكرار الألوان // نقدر نكرر استخدام الألوان بدون ما نخرج عن حدود القائمة
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: NoteItem(color: color),
          );
        },
      ),
    );
  }
}
