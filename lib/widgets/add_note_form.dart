import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subTitle;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // AutovalidateMode يحدد متى تظهر أخطاء الفورم تلقائيًا.
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            title: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            title: 'Content',
            maxLines: 5,
            onsaved: (value) {
              subTitle = value;
            },
          ),
          const ColorsListView(),
          const SizedBox(height: 32),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoding: state is AddNoteLoading ? true : false,
                title: 'Add Note',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('Title: $title  & SubTitle: $subTitle');
                    var currentDate = DateTime.now();
                    var formattedCurrentDate = DateFormat(
                      'dd-MM-yyyy',
                    ).format(currentDate);
                    var note = NoteModel(
                      title: title!,
                      content: subTitle!,
                      dateTime: formattedCurrentDate,
                      color: Colors.blue.value,
                    );
                    context.read<AddNoteCubit>().addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    /*🔁 يفحص الأخطاء دائمًا تلقائيًا في الفورم بمجرد ما المستخدم يكتب أو يغير أي شيء، بدون ما ينتظر يضغط زر إرسال.
                          مثال سريع:
                          لو عندك حقل بريد إلكتروني، والمستخدم كتب شيء خطأ، بيطلع له الخطأ على طول وهو يكتب 
                          
                          فيه أوضاع ثانية زي:
                            AutovalidateMode.disabled: ما يتحقق من الأخطاء إلا لما تضغط زر الإرسال.
                            AutovalidateMode.onUserInteraction: يبدأ يتحقق بعد أول تفاعل من المستخدم.
                          */
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
