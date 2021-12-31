class Notes {
  int? id;
  String penulis;
  String matkul;
  String topik;
  String keterangan;
  String link;

  Notes({
    this.id,
    required this.penulis,
    required this.matkul,
    required this.topik,
    required this.keterangan,
    required this.link,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      id: json["id"],
      penulis: json["Penulis"],
      matkul: json["Matkul"],
      topik: json["Topik"],
      keterangan: json["Keterangan"],
      link: json["Link"],
    );
  }

  dynamic toJson() => {
        'id': id,
        'Penulis': penulis,
        'Matkul': matkul,
        'Topik': topik,
        'Keterangan': keterangan,
        'Link': link
      };
}
