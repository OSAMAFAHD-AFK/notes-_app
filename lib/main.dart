import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
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
