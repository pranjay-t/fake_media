class PostModel {
  String postId;
  String userId;
  String title;
  String content;
  String name;
  String username;
  PostModel({
    required this.postId,
    required this.userId,
    required this.title,
    required this.content,
    required this.name,
    required this.username,

  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'].toString(),
      postId: json['id'].toString(),
      title: json['title'] ?? '',
      content: json['body'] ?? '',
      name: json['body'] ?? '',
      username: json['body'] ?? '',
    );
  }

}