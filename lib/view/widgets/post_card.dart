import 'package:fake_media/view/widgets/user_header.dart';
import 'package:fake_media/controllers/user_controller.dart';
import 'package:fake_media/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final UserController userController;

  const PostCard({
    super.key,
    required this.post,
    required this.userController,
  });

  @override
  Widget build(BuildContext context) {
    // int id = int.parse(post.userId);

    if (!userController.users.containsKey(post.userId) &&
        !userController.userErrors.containsKey(post.userId)) {
      userController.fetchUserById(post.userId);
    }

    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 31, 31, 31),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final user = userController.users[post.userId];
              final hasError = userController.userErrors.containsKey(post.userId);

              return UserHeader(
                user: user,
                hasError: hasError,
                error: userController.userErrors[post.userId],
              );
            }),
            const SizedBox(height: 14),
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              post.content,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
