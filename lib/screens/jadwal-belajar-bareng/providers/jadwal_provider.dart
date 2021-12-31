import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/models/jadwal_model.dart';

class JadwalBelajarProvider with ChangeNotifier {
  JadwalBelajarProvider() {
    fetchJadwal();
  }

  List<JadwalBelajarModel> _jadwal = [];

  List<JadwalBelajarModel> get jadwal {
    return [..._jadwal];
  }

  fetchJadwal() async {
    final response = await http.get(Uri.parse(
        'https://stu-do-list.herokuapp.com/jadwal-belajar-bareng/jadwal-belajar-json/jadwal'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _jadwal = data.map<JadwalBelajarModel>((json) => JadwalBelajarModel.fromJson(json)).toList();
      notifyListeners();
    }
  }

  void tambahJadwal(JadwalBelajarModel jadwalbelajar) async {
    final response = await http.post(
        Uri.parse(
            'https://stu-do-list.herokuapp.com/jadwal-belajar-bareng/jadwal-belajar-json/jadwal'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jadwalbelajar));
    if (response.statusCode == 201) {
      jadwalbelajar.id = json.decode(response.body)['id'];
      _jadwal.add(jadwalbelajar);
      notifyListeners();
    }
  }

  void hapusJadwal(JadwalBelajarModel jadwalbelajar) async {
    int? jadwalId= jadwalbelajar.id;
    final response = await http.delete(Uri.parse(
        'https://stu-do-list.herokuapp.com/jadwal-belajar-bareng/jadwal-belajar-json/jadwal/$jadwalId'));
    if (response.statusCode == 204) {
      _jadwal.remove(jadwalbelajar);
      notifyListeners();
    }
  }
}