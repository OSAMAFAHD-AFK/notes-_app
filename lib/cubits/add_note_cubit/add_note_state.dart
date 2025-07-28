part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {} // في حالة الانتظار

final class AddNoteSuccess extends AddNoteState {} // في حالة النجاح

final class AddNoteFailur extends AddNoteState {
  // في حالة الفشل
  final String errMessage;

  AddNoteFailur(this.errMessage);
}

/* خاص بها Cubit كل صفحة في التطبيق لها 

→ منفصل Cubit أي أن كل صفحة تدير حالتها بشكل مستقل باستخدام كلاس 
Cubit خاص بها، وهذا يعني أن كل صفحة يمكنها التعامل مع حالتها الخاصة دون الحاجة إلى التأثير على الصفحات الأخرى.
وهذا يتبع مبدأ STP.

كل عملية وكل جزء من التطبيق يكون مفصول في ملف خاص به لتسهيل إدارة الحالة وتنظيم الكود.
 */
