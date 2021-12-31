import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final agenda = AgendaModelFromJson(jsonString);

List<AgendaModel> agendaModelFromJson(String str) => List<AgendaModel>.from(
    json.decode(str).map((x) => AgendaModel.fromJson(x)));

String agendaModelToJson(List<AgendaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgendaModel {
  AgendaModel({
    @required this.model,
    @required this.pk,
    @required this.fields,
  });

  String? model;
  int? pk;
  Fields? fields;

  factory AgendaModel.fromJson(Map<String, dynamic> json) => AgendaModel(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields!.toJson(),
      };
}

class Fields {
  Fields({
    this.user,
    @required this.matkul,
    @required this.judul,
    @required this.tanggal,
    @required this.waktu,
    @required this.keterangan,
  });

  dynamic? user;
  String? matkul;
  String? judul;
  // DateTime? tanggal;
  String? tanggal;
  String? waktu;
  String? keterangan;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        matkul: json["matkul"],
        judul: json["judul"],
        // tanggal: DateTime.parse(json["tanggal"]),
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "matkul": matkul,
        "judul": judul,
        // "tanggal":
        //     "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "tanggal": tanggal,
        "waktu": waktu,
        "keterangan": keterangan,
      };
}
