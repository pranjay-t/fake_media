class CommentModel {
  final String id;
  final String postId;
  final String name;
  final String email;
  final String content;
  CommentModel({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.content,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'].toString(),
      postId: json['postId'].toString(),
      email: json['email'] ?? '',
      content: json['body'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
