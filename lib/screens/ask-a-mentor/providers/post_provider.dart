import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/ask-a-mentor/models/post.dart';

class PostProvider with ChangeNotifier {
  PostProvider() {
    fetchPosts();
  }

  List<Post> _posts = [];

  List<Post> get posts {
    return [..._posts];
  }

  fetchPosts() async {
    final response = await http.get(Uri.parse(
        'https://stu-do-list.herokuapp.com/ask-a-mentor/askamentor-jsonpost'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _posts = data.map<Post>((json) => Post.fromJson(json)).toList();
      notifyListeners();
    }
  }

  void addPost(Post post) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/ask-a-mentor/askamentor-jsonpost'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post));
    if (response.statusCode == 201) {
      post.id = json.decode(response.body)["id"];
      _posts.add(post);
      notifyListeners();
    }
  }
}
