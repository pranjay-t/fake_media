/*
  A model representing a user in the application.
  This class contains user details such as user ID, name, and username.
*/
class UserModel {
  // Unique identifier for the user.
  final String userId;
  // The full name of the user.
  final String name;
  // The username of the user.
  final String username;

  /// Creates a [UserModel] with required fields.
  UserModel({
    required this.userId,
    required this.name,
    required this.username,
  });

  /*
    Factory constructor to create a [UserModel] from JSON data.
    Converts the JSON map into a [UserModel] instance, ensuring proper parsing.
  */
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'].toString(), // Convert userId to String
      name: json['name'] ?? '', // Default to empty string if missing
      username: json['username'] ?? '', // Default to empty string if missing
    );
  }

  /// Returns a string representation of the user model.
  @override
  String toString() => 'UserModel(userId: $userId, name: $name, username: $username)';
}
