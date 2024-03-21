import 'dart:collection';
import 'package:flutter/material.dart';

class Note {
  const Note(this.id, this.title);

  final int id;
  final String title;

}

class NotebookModel extends ChangeNotifier {

  final List<Note> _notes = [];

  UnmodifiableListView<Note> get notebooks => UnmodifiableListView(_notes);

  int get count => _notes.length;
  List<Note> get notes => _notes;

  Note getNote(int i) => _notes[i];

  void add(Note n) {
    _notes.add(n);
    notifyListeners();
  }

  void remove(int id) {
    _notes.removeWhere((nb) => nb.id == id);
    notifyListeners();
  }
}