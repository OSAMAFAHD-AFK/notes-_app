import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              //🟢 اسمح للـ Bottom Sheet أن تأخذ كامل ارتفاع الشاشة إذا احتاجت (يعني ممكن تصير طويلة وتوصل لأعلى الشاشة).
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
                // وظهور التحديثات build فصلناها في ودجت منفصلة من اجل نستخدم
              },
            );
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add, color: Colors.black),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
