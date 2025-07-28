import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          /* CustomTextField(title: 'Title'),
          SizedBox(height: 24),
          CustomTextField(title: 'Content', maxLines: 5),
          SizedBox(height: 32),
          CustomButton(title: 'Add Note'),
          SizedBox(height: 16),*/
        ],
      ),
    );
  }
}
