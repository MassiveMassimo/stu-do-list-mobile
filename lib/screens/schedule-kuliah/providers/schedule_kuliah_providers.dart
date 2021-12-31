import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/screens/schedule-kuliah/models/jadwal.dart';
import 'package:mobile/screens/schedule-kuliah/models/jadwal_matkul.dart';
import 'package:mobile/screens/schedule-kuliah/models/matkul.dart';

class ScheduleKuliahProvider with ChangeNotifier {
  String url = "http://stu-do-list.herokuapp.com";

  ScheduleKuliahProvider() {
    fetchJadwalMatkuls();
  }

  List<JadwalMatkul> _jadwalMatkuls = [];

  List<JadwalMatkul> get jadwalMatkuls {
    return [..._jadwalMatkuls];
  }

  fetchJadwalMatkuls() async {
    final response =
        await http.get(Uri.parse(url + '/schedule-kuliah/api/get-jadwal/1'));
    if (response.statusCode == 200) {
      _jadwalMatkuls = [];
      var res = json.decode(response.body) as Map<String, dynamic>;
      res["data"].forEach((k, v) {
        Matkul matkul =
            Matkul(nama: k, id: v["id"], kelas: v["kelas"], sks: v["SKS"]);

        List<Jadwal> jadwals = [];
        v["jadwal"].forEach((e) {
          Map<String, dynamic> jadwal = e["fields"];
          jadwals.add(Jadwal(
              hari: jadwal["hari"],
              start: jadwal["start"],
              end: jadwal["end"]));
        });

        _jadwalMatkuls.add(JadwalMatkul(matkul: matkul, jadwals: jadwals));
      });
      notifyListeners();
    }
  }

  Future<Matkul> addMatkul(Matkul matkul) async {
    final response = await http.post(
        Uri.parse(url + '/schedule-kuliah/api/add-matkul/1'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(matkul));
    if (response.statusCode == 200) {
      notifyListeners();
      fetchJadwalMatkuls();

      var res = json.decode(response.body) as Map<String, dynamic>;

      matkul.id = res["data"]["id"];
    }
    return matkul;
  }

  void deleteMatkul(int? matkulId) async {
    final response = await http.delete(
        Uri.parse(url + '/schedule-kuliah/api/delete-matkul/$matkulId'));
    if (response.statusCode == 200) {
      _jadwalMatkuls = _jadwalMatkuls
          .where((jadwal) => jadwal.matkul.id != matkulId)
          .toList();
      notifyListeners();
    }
  }

  void addJadwal(Jadwal jadwal) async {
    print(json.encode(jadwal));
    final response = await http.post(
        Uri.parse(url + '/schedule-kuliah/api/add-jadwal/${jadwal.matkul}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jadwal));
    if (response.statusCode == 200) {
      notifyListeners();
      fetchJadwalMatkuls();
    }
  }
}
