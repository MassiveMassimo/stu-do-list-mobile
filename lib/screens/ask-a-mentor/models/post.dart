class Post {
  int? id;
  String username;
  String title;
  String matkul;
  String message;
  String time;

  Post({
    this.id,
    required this.username,
    required this.title,
    required this.matkul,
    required this.message,
    required this.time,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      username: json["username"],
      title: json["title"],
      matkul: json["matkul"],
      message: json["message"],
      time: json["time"],
    );
  }

  dynamic toJson() => {
    'id': id,
    'username': username,
    'title': title,
    'matkul': matkul,
    'message': message,
    'time': time,
  };
}
