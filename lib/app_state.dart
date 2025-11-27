import 'dart:io';

class AppState {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;

  AppState._internal();

  // USER PROFILE DATA
  String? userName;
  String? userRole;
  File? userImage;

  // POSTS (list of maps)
  List<Map<String, dynamic>> posts = [];

  // 🚀 Add a post
  void addPost({
    required String content,
    File? image,
  }) {
    posts.insert(0, {
      "name": userName ?? "Unnamed User",
      "role": userRole ?? "Unknown Role",
      "image": userImage,
      "content": content,
      "postImage": image,
      "time": "Just now",
    });
  }
}
