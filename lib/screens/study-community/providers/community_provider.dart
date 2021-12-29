import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/study-community/models/community.dart';

class CommunityProvider with ChangeNotifier {
  CommunityProvider() {
    this.fetchCommunities();
  }

  List<Community> _communities = [];

  List<Community> get communities {
    return [..._communities];
  }

  fetchCommunities() async {
    final response = await http.get(Uri.parse(
        'https://stu-do-list.herokuapp.com/study-communities/community-jsoncommunity'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _communities =
          data.map<Community>((json) => Community.fromJson(json)).toList();
      notifyListeners();
    }
  }

  void addCommunity(Community comm) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/study-communities/community-jsoncommunity'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(comm));
    if (response.statusCode == 201) {
      comm.id = json.decode(response.body)['id'];
      _communities.add(comm);
      notifyListeners();
    }
  }

  void deleteCommunity(Community comm) async {
    int? comm_id = comm.id;
    final response = await http.delete(Uri.parse(
        'https://stu-do-list.herokuapp.com/study-communities/community-jsoncommunity/$comm_id'));
    if (response.statusCode == 204) {
      _communities.remove(comm);
      notifyListeners();
    }
  }
}
