/* 
  A model representing a comment on a post.
  This class contains details about a comment, including the commenter's name, email, associated post, and content.
*/
class CommentModel {
  // Unique identifier for the comment.
  final String id;
  // The ID of the post this comment belongs to.
  final String postId;
  // The name of the person who posted the comment.
  final String name;
  // The email address of the commenter.
  final String email;
  // The content/body of the comment.
  final String content;

  /// Creates a [CommentModel] with required fields.
  CommentModel({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.content,
  });

  /* 
    Factory constructor to create a [CommentModel] from JSON data.
    Converts the JSON map into a [CommentModel] instance,ensuring that all fields are properly parsed and converted.
  */
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'].toString(), // Convert ID to String 
      postId: json['postId'].toString(), // Convert post ID to String
      email: json['email'] ?? '', // Default to empty string if email is missing
      content: json['body'] ?? '', // Default to empty string if body is missing
      name: json['name'] ?? '', // Default to empty string if name is missing
    );
  }
}
