import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      /* للتطبيق كامل  وتحتاجة لصفحة واحدة Cubit ملاحظة: لو كنت لا تحتاج الى  BlocProvider
        فقط قم بكتابتة في الصفحة التي تريد استخدامة وهذا يزيد الاداء التطبيق */
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailur) {
              log('Failur ${state.errMessage}');
            }

            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                // استخدامها للسماح بالتمرير في حالة الحاجة إلى مساحة أكبر من الشاشة
                // هذا مفيد عند إضافة ملاحظات طويلة // يمكن أن يكون مفيدًا في حالة وجود لوحة مفاتيح مفتوحة
                child: const AddNoteForm(),
              ),
            );
          },
        ),
      ),
    );
  }
}
