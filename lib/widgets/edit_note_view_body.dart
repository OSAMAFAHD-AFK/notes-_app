import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/helper/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              showSnackBar(context, 'Note Updated Successfully');
              context.read<NotesCubit>().fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 60),
          CustomTextField(
            title: 'Title',
            initialValue: widget.note.title, // ✅ عرض القيمة القديمة
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            title: 'Content',
            initialValue: widget.note.content, // ✅ عرض القيمة القديمة
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 24),
          EditNoteCokorsList(note: widget.note),
        ],
      ),
    );
  }
}
