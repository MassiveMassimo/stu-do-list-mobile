class Community {
  int? id;
  String nama;
  String kelas;
  String prodi;
  String info;
  String link;

  Community({
    this.id,
    required this.nama,
    required this.kelas,
    required this.prodi,
    required this.info,
    required this.link,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json["id"],
      nama: json["nama"],
      kelas: json["kelas"],
      prodi: json["prodi"],
      info: json["info"],
      link: json["link"],
    );
  }

  dynamic toJson() => {
        'id': id,
        'nama': nama,
        'kelas': kelas,
        'prodi': prodi,
        'info': info,
        'link': link
      };
}
