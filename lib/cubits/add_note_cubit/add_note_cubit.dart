import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color selectedColor = const Color(0xffFFCC80);

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      log("عدد العناصر في الصندوق: ${noteBox.length}");
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailur('Failed to add note: $e'));
    }
  }
}
