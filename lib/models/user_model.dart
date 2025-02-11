class UserModel {
  String userId;
  String name;
  String username;
  UserModel({
    required this.userId,
    required this.name,
    required this.username,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'username': username,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'].toString(),
      name: json['name'] as String,
      username: json['username'] as String,
    );
  }


  @override
  String toString() => 'UserModel(userId: $userId, name: $name, username: $username)';

 
}
