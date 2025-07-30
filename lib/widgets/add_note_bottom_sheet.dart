import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      /* للتطبيق كامل  وتحتاجة لصفحة واحدة Cubit ملاحظة: لو كنت لا تحتاج الى  BlocProvider
        فقط قم بكتابتة في الصفحة التي تريد استخدامة وهذا يزيد الاداء التطبيق 
       main() لكن اذا كنت تريد الوصول الية للتطبيق كامل فاكتبة في الدالة الريسئية*/
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
            return AbsorbPointer(
              // منع التفاعل مع الشاشة أثناء التحميل : AbsorbPointer
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ), // 🔽 المسافة التي يشغلها الكيبورد من أسفل الشاشة.
                child: SingleChildScrollView(
                  // استخدامها للسماح بالتمرير في حالة الحاجة إلى مساحة أكبر من الشاشة
                  // هذا مفيد عند إضافة ملاحظات طويلة // يمكن أن يكون مفيدًا في حالة وجود لوحة مفاتيح مفتوحة
                  child: const AddNoteForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*الفرق بين BlocBuilder و BlocConsumer و BlocListener بشكل بسيط وسلس:

✅ BlocBuilder
الغرض: إعادة بناء واجهة المستخدم (UI) عند تغير الحالة.
🔄 يعيد بناء الواجهة تلقائيًا عندما تتغير الحالة.
❌ لا يستخدم لتنفيذ أوامر جانبية مثل إظهار Snackbar أو الانتقال إلى صفحة.
📦 الاستخدام المعتاد: عرض بيانات من الحالة مثل قائمة أو رسالة خطأ.


✅ BlocListener
الغرض: تنفيذ عمليات جانبية (side effects) عند تغير الحالة.
✅ لا يعيد بناء الواجهة.
🔔 يستخدم لتنفيذ أوامر مثل:
إظهار Snackbar
عرض Dialog
التنقل بين الصفحات


✅ BlocConsumer
الغرض: دمج BlocBuilder و BlocListener معًا.
🧩 يحتوي على builder + listener.
🧠 مثالي عندما تحتاج أن:
تعيد بناء واجهة المستخدم وت
تنفذ أوامر جانبية بناءً على الحالة.


📌 MediaQuery
Flutter هي أداة في 
 تُستخدم للحصو
 عن حجم الشاشة، الاتجاه، والأشياء التي تؤثر على التصميم مثل الكيبورد 
 ل على معلومات  أو الشريط العلوي  أو السفلي. */
