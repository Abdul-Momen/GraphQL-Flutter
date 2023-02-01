// To parse this JSON data, do
//
//     final postResponse = postResponseFromMap(jsonString);

import 'dart:convert';

class PostResponse {
  PostResponse({
    required this.data,
  });

  PostResponseData data;

  PostResponse copyWith({
    PostResponseData? data,
  }) =>
      PostResponse(
        data: data ?? this.data,
      );

  factory PostResponse.fromJson(String str) => PostResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostResponse.fromMap(Map<String, dynamic> json) => PostResponse(
    data: PostResponseData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
  };
}

class PostResponseData {
  PostResponseData({
    required this.posts,
  });

  Posts posts;

  PostResponseData copyWith({
    Posts? posts,
  }) =>
      PostResponseData(
        posts: posts ?? this.posts,
      );

  factory PostResponseData.fromJson(String str) => PostResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostResponseData.fromMap(Map<String, dynamic> json) => PostResponseData(
    posts: Posts.fromMap(json["posts"]),
  );

  Map<String, dynamic> toMap() => {
    "posts": posts.toMap(),
  };
}

class Posts {
  Posts({
    required this.data,
    required this.meta,
  });

  List<Datum> data;
  Meta meta;

  Posts copyWith({
    List<Datum>? data,
    Meta? meta,
  }) =>
      Posts(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory Posts.fromJson(String str) => Posts.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Posts.fromMap(Map<String, dynamic> json) => Posts(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    meta: Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "meta": meta.toMap(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
  });

  String id;
  String title;

  Datum copyWith({
    String? id,
    String? title,
  }) =>
      Datum(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
  };
}

class Meta {
  Meta({
    required this.totalCount,
  });

  int totalCount;

  Meta copyWith({
    int? totalCount,
  }) =>
      Meta(
        totalCount: totalCount ?? this.totalCount,
      );

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toMap() => {
    "totalCount": totalCount,
  };
}
