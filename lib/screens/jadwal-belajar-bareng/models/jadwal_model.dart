class JadwalBelajarModel {
  int? id;
  String prioritas;
  String matkul;
  String waktu;
  String topik;
  String info;
  String link;

  JadwalBelajarModel({
    this.id, required this.prioritas, required this.matkul, required this.waktu, required this.topik, required this.info, required this.link,
  });

  factory JadwalBelajarModel.fromJson(Map<String, dynamic> json) {
    return JadwalBelajarModel(
      id: json["id"], prioritas: json["Prioritas"], matkul: json["Matkul"], waktu: json["Waktu"], topik: json["Topik"], info: json["Informasi"], link: json["Link"],
    );
  }

  dynamic toJson() => {
        'id': id, 'Prioritas': prioritas, 'Matkul': matkul, 'Waktu': waktu, 'Topik': topik, 'Informasi': info, 'Link': link,
      };
}