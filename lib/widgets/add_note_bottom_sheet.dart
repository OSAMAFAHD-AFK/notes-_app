import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 30,
      ),
      child: SingleChildScrollView(
        // استخدامها للسماح بالتمرير في حالة الحاجة إلى مساحة أكبر من الشاشة
        // هذا مفيد عند إضافة ملاحظات طويلة // يمكن أن يكون مفيدًا في حالة وجود لوحة مفاتيح مفتوحة
        child: Column(
          children: const [
            CustomTextField(title: 'Title'),
            SizedBox(height: 24),
            CustomTextField(title: 'Content', maxLines: 5),
            SizedBox(height: 32),
            CustomButton(title: 'Add Note'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
