// To parse this JSON data, do
//
//     final createPostResponse = createPostResponseFromMap(jsonString);

import 'dart:convert';

class CreatePostResponse {
  CreatePostResponse({
    required this.data,
  });

  CreateResponseData data;

  CreatePostResponse copyWith({
    CreateResponseData? data,
  }) =>
      CreatePostResponse(
        data: data ?? this.data,
      );

  factory CreatePostResponse.fromJson(String str) => CreatePostResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePostResponse.fromMap(Map<String, dynamic> json) => CreatePostResponse(
    data: CreateResponseData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
  };
}

class CreateResponseData {
  CreateResponseData({
    required this.createPost,
  });

  CreatePost createPost;

  CreateResponseData copyWith({
    CreatePost? createPost,
  }) =>
      CreateResponseData(
        createPost: createPost ?? this.createPost,
      );

  factory CreateResponseData.fromJson(String str) => CreateResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateResponseData.fromMap(Map<String, dynamic> json) => CreateResponseData(
    createPost: CreatePost.fromMap(json["createPost"]),
  );

  Map<String, dynamic> toMap() => {
    "createPost": createPost.toMap(),
  };
}

class CreatePost {
  CreatePost({
    required this.id,
    required this.title,
    required this.body,
  });

  String id;
  String title;
  String body;

  CreatePost copyWith({
    String? id,
    String? title,
    String? body,
  }) =>
      CreatePost(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory CreatePost.fromJson(String str) => CreatePost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePost.fromMap(Map<String, dynamic> json) => CreatePost(
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "body": body,
  };
}
