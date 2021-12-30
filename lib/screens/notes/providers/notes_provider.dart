import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/notes/models/notes_model.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    fetchNotes();
  }

  List<Notes> _notes = [];

  List<Notes> get notes {
    return [..._notes];
  }

  fetchNotes() async {
    final response = await http.get(Uri.parse(
        'https://stu-do-list.herokuapp.com/notes/json/notes'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _notes =
          data.map<Notes>((json) => Notes.fromJson(json)).toList();
      notifyListeners();
    }
  }

  void addNotes(Notes notes) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/notes/json/notes'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(notes));
    if (response.statusCode == 201) {
      notes.id = json.decode(response.body)['id'];
      _notes.add(notes);
      notifyListeners();
    }
  }

  void deleteNotes(Notes notes) async {
    int? notes_id = notes.id;
    final response = await http.delete(Uri.parse(
        'https://stu-do-list.herokuapp.com/notes/json/notes/$notes_id'));
    if (response.statusCode == 204) {
      _notes.remove(notes);
      notifyListeners();
    }
  }
}
