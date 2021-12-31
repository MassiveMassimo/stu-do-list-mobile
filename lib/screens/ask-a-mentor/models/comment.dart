class Comment {
  int? id;
  String username;
  String comment;
  String time;
  int? post;

  Comment({
    this.id,
    required this.username,
    required this.comment,
    required this.time,
    required this.post,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      username: json["username"],
      comment: json["comment"],
      time: json["time"],
      post: json["post"],
    );
  }

  dynamic toJson() => {
    'id': id,
    'username': username,
    'comment': comment,
    'time': time,
    'post': post,
  };
}
