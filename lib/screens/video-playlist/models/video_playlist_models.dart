// import 'dart:convert';
// import 'dart:core';

// class VideoPlaylistModel {
//   String title;
//   String link;

//   VideoPlaylistModel({
//     required this.title,
//     required this.link,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'link': link,
//     };
//   }

//   factory VideoPlaylistModel.fromJson(Map<String, dynamic> map) {
//     return VideoPlaylistModel(
//       title: map['title'],
//       link: map['link'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   @override
//   String toString() => 'VideoPlaylistModel(title: $title, link: $link)';
// }
import 'dart:convert';

List<VideoPlaylistModel> VideoPlaylistModelFromJson(String str) =>
    List<VideoPlaylistModel>.from(
        json.decode(str).map((x) => VideoPlaylistModel.fromJson(x)));

String VideoPlaylistModelToJson(List<VideoPlaylistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoPlaylistModel {
  VideoPlaylistModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory VideoPlaylistModel.fromJson(Map<String, dynamic> json) =>
      VideoPlaylistModel(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.title,
    required this.link,
  });

  String title;
  String link;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["Title"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Link": link,
      };
}

enum Model { VIDEO_PLAYLIST_VIDEO }

final modelValues =
    EnumValues({"video_playlist.video": Model.VIDEO_PLAYLIST_VIDEO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
