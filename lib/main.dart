import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter(); //hive حق init وليس  hive_flutter حق initFlutter ركز هنا استخدم
  await Hive.openBox(kNotesBox); // فتح صندوق الملاحظات
  Hive.registerAdapter(NoteModelAdapter());
  // حتى يستطيع حفظه وقراءته. Hive في (NoteModel مثل) وظيفتها تسجيل نوع بيانات مخصص   : Hive.registerAdapter

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        /*
        للتطبيق كامل  وتحتاجة لصفحة واحدة Cubit ملاحظة: لو كنت لا تحتاج الى  BlocProvider
        فقط قم بكتابتة في الصفحة التي تريد استخدامة وهذا يزيد الاداء التطبيق */
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          // هذا يجعل كل نوع الخط حق التطبيق نفسة نوع واحد
          brightness: Brightness.dark,
          // scaffoldBackgroundColor: Colors.amber, // ThemeData هذة اذا تريد تحديد الون مخصص
        ),
        home: const NotesView(),
      ),
    );
  }
}

/*✅ Hive أولًا: ما هي 
Hive هي مكتبة قاعدة بيانات محلية (Offline) خفيفة وسريعة لتطبيقات Flutter وDart، تستخدم لتخزين البيانات داخل الجهاز بدون إنترنت.

أهم مميزاتها:
سريعة جدًا (مبنية على binary storage).
لا تحتاج SQLite أو أي تبعيات خارجية.
سهلة الاستخدام.
تدعم تخزين أنواع بيانات متعددة: String, int, Map, List, وحتى كائنات (Objects).


✅ ثانيًا: لماذا Hive تعتبر قاعدة بيانات NoSQL؟
لأنها:
لا تعتمد على الجداول والعلاقات (Tables/Relations) مثل SQL.
تخزن البيانات على شكل مفاتيح وقيم (Key-Value).


✅ ثالثًا: ما الفرق بينها وبين قواعد البيانات الأخرى؟
| النوع | الشكل | منظم؟ | يحتاج Schema؟ | العلاقات |
|-------|--------|--------|----------------|----------|
| ✅ Hive (NoSQL) | key-value | غير منظم | لا | لا |
| ✅ SQLite (SQL) | جدول | منظم | نعم | نعم |
| ✅ SharedPreferences | key-value | بسيط جدًا | لا | لا |
| ✅ ObjectBox | NoSQL كائني | منظم نوعًا ما | لا | نعم بسيط |
| ✅ Moor (Drift) | SQL مع واجهة Dart | منظم | نعم | نعم |


✅ رابعًا: ما الخيارات لتخزين البيانات محليًا في Flutter؟
المكتبة	النوع	الاستخدام	الأفضلية
Hive	NoSQL	تخزين بيانات متوسطة أو كبيرة	🔥 سريع وسهل، ممتاز للملاحظات
SharedPreferences	Key-Value	تخزين إعدادات بسيطة فقط	جيد جدًا للإعدادات
SQLite	SQL	تخزين منظم ومعقد بعلاقات	ممتاز للمشاريع الكبيرة
ObjectBox	NoSQL OOP	تخزين كائنات بشكل مباشر	سريع ولكن حجمه كبير
Drift (ex: Moor)	SQL مع ORM	واجهة Dart لـ SQLite	ممتاز لو تحب SQL مع API نظيف


✅ خامسًا: أيهم الأفضل ولماذا؟
الحالة	الأفضل
تريد تخزين إعدادات بسيطة (مثل الوضع الليلي، اللغة)	SharedPreferences
تريد تخزين ملاحظات، مهام، بيانات بسيطة ومتعددة	Hive ✅
تريد تخزين بيانات معقدة جدًا ومترابطة (طلبيات، فواتير، علاقات كثيرة)	SQLite أو Drift
تريد السرعة والسهولة وتخزين كائنات مباشرة	ObjectBox أو Hive


✅ خلاصة:
Hive: خيار ممتاز لـ 80% من تطبيقات Flutter التي تحتاج تخزين محلي سهل وسريع.
إذا كنت تبني تطبيق ملاحظات، مهام، أو حجز بسيط ➜ Hive مناسب جدًا.
إذا كان عندك بيانات معقدة كثيرة العلاقات ➜ SQLite أو Drift أفضل. */
