import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/ask-a-mentor/models/comment.dart';

class CommentProvider with ChangeNotifier {
  CommentProvider() {
    this.fetchComments();
  }

  List<Comment> _comments = [];

  List<Comment> get comments {
    return [..._comments];
  }

  fetchComments() async {
    final response = await http.get(Uri.parse(
        'https://stu-do-list.herokuapp.com/ask-a-mentor/askamentor-jsoncomment'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _comments = data.map<Comment>((json) => Comment.fromJson(json)).toList();
      notifyListeners();
    }
  }

  void addComment(Comment comment) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/ask-a-mentor/askamentor-jsoncomment'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(comment));
    if (response.statusCode == 201) {
      comment.id = json.decode(response.body)["id"];
      _comments.add(comment);
      notifyListeners();
    }
  }
}
