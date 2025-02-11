import 'package:fake_media/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final userController = Get.put(UserController());
  late String uid ;

  @override
  void initState() {
    super.initState();
    uid = userController.userId.value!;
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    await userController.fetchUserById(uid);
  }

  @override
  Widget build(BuildContext context) {
    final user = userController.users[uid]!;
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '@${user.username}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
