import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter(); //hive حق init وليس  hive_flutter حق initFlutter ركز هنا استخدم
  await Hive.openBox(kNotesBox); // فتح صندوق الملاحظات
  Hive.registerAdapter(NoteModelAdapter());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:
            'Poppins', // هذا يجعل كل نوع الخط حق التطبيق نفسة نوع واحد
        brightness: Brightness.dark,
        // scaffoldBackgroundColor: Colors.amber, // ThemeData هذة اذا تريد تحديد الون مخصص
      ),
      home: const NotesView(),
    );
  }
}
