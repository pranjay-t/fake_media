import 'package:fake_media/common/error_text.dart';
import 'package:fake_media/common/loader.dart';
import 'package:fake_media/controllers/user_controller.dart';
import 'package:fake_media/view/screens/user_profile_screen.dart';
import 'package:fake_media/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHeader extends StatelessWidget {
  final UserModel? user;
  final bool hasError;
  final String? error;

  const UserHeader({
    super.key,
    required this.user,
    required this.hasError,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user != null)
          GestureDetector(
            onTap: () {
              userController.userId.value = user!.userId;
              Get.to(() => UserProfileScreen());
            },
            child: const CircleAvatar(
              radius: 26,
            ),
          ),
        const SizedBox(width: 15),
        if (user != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.name,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '@${user!.username}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          )
        else if (hasError)
          ErrorText(error: error!)
        else
          const SizedBox(
            height: 20,
            width: 20,
            child: Loader(),
          ),
      ],
    );
  }
}
