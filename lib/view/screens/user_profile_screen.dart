import 'package:fake_media/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
 A screen that displays the user's profile information. 
 This screen fetches and displays details such as the user's name and username. It retrieves data from the [UserController].
*/
class UserProfileScreen extends StatefulWidget {
  /// Constructs a [UserProfileScreen].
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  /// Instance of [UserController] to manage user data.
  final userController = Get.put(UserController());
  
  // Stores the unique identifier for the user.
  late String uid;

  @override
  void initState() {
    super.initState();
    uid = userController.userId.value!; // Retrieve user ID from the controller.
    fetchUserData();
  }

  /// Fetches user data from the API based on the [uid].
  Future<void> fetchUserData() async {
    await userController.fetchUserById(uid);
  }

  @override
  Widget build(BuildContext context) {
    final user = userController.users[uid]!; // Retrieve user details.
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name), // Displays the user's name in the app bar.
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 60, // Displays a circular avatar.
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(           //Displays a user's name
            user.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(           //Displays a user's username
            '@${user.username}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
