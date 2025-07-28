import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: SingleChildScrollView(
        // استخدامها للسماح بالتمرير في حالة الحاجة إلى مساحة أكبر من الشاشة
        // هذا مفيد عند إضافة ملاحظات طويلة // يمكن أن يكون مفيدًا في حالة وجود لوحة مفاتيح مفتوحة
        child: AddNoteForm(),
      ),
    );
  }
}

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
          const SizedBox(height: 32),
          CustomButton(
            title: 'Add Note',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
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
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
