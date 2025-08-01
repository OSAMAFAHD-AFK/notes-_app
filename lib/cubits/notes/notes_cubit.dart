import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  void fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList().reversed.toList();
    // ← عكس الترتيب هنا لأننا نريد أن تكون الملاحظات الأحدث في الأعلى.
    log('notes!.length is ${notes!.length}');
    emit(NotesSuccess());
  }
}
