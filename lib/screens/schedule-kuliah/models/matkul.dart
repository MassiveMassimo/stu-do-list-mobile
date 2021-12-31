class Matkul {
  int? id;
  String nama;
  String kelas;
  int sks;

  Matkul({
    this.id,
    required this.nama,
    required this.kelas,
    required this.sks,
  });

  factory Matkul.fromJson(Map<String, dynamic> json) {
    return Matkul(
      id: json["pk"],
      nama: json["fields"]["nama"],
      kelas: json["fields"]["kelas"],
      sks: json["fields"]["SKS"],
    );
  }

  dynamic toJson() => {
        'nama': nama,
        'kelas': kelas,
        'SKS': sks,
      };
}
