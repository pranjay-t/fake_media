/*
  A model representing a post in the application.
  This class contains details about a post, including its title, content, author details, and identifiers.
*/
class PostModel {
  // Unique identifier for the post.
  final String postId;
  // The ID of the user who created the post.
  final String userId;
  // The title of the post.
  final String title;
  // The main content/body of the post.
  final String content;
  // The name of the user who created the post.
  final String name;
  // The username of the post author.
  final String username;

  /// Creates a [PostModel] with required fields.
  PostModel({
    required this.postId,
    required this.userId,
    required this.title,
    required this.content,
    required this.name,
    required this.username,
  });

  /* 
    Factory constructor to create a [PostModel] from JSON data.
    Converts the JSON map into a [PostModel] instance, ensuring that all fields are properly parsed and converted.
  */
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'].toString(), // Convert userId to String
      postId: json['id'].toString(), // Convert postId to String
      title: json['title'] ?? '', // Default to empty string if title is missing
      content: json['body'] ?? '', // Default to empty string if body is missing
      name: json['name'] ?? '', // Default to empty string if author's name is missing
      username: json['username'] ?? '', // Default to empty string if author's username is missing
    );
  }
}
