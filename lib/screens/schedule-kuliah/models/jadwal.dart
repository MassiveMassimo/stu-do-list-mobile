class Jadwal {
  int? id;
  int? matkul;
  String hari;
  String start;
  String end;

  Jadwal({
    this.id,
    this.matkul,
    required this.hari,
    required this.start,
    required this.end,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      id: json["pk"],
      hari: json["fields"]["hari"],
      start: json["fields"]["start"],
      end: json["fields"]["end"],
    );
  }

  dynamic toJson() => {
        'hari': hari,
        'start': start,
        'end': end,
      };
}
