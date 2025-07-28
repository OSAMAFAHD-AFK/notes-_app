import 'package:hive/hive.dart';

part 'note_model.g.dart';
/* عند تشغيل الأمر Hive هذا الملف يتم إنشاؤه تلقائيًا بواسطة 
  `flutter packages pub run build_runner build`*/

@HiveType(typeId: 0) //فريدًا لكل  كلاس typeId يجب أن يكون
class NoteModel extends HiveObject {
  @HiveField(0) //Hive يستخدم لتحديد الحقل في
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final DateTime dateTime;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.content,
    required this.dateTime,
    required this.color,
  });
}
