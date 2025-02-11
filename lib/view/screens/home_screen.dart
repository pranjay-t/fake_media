import 'package:fake_media/common/error_text.dart';
import 'package:fake_media/common/loader.dart';
import 'package:fake_media/controllers/post_controller.dart';
import 'package:fake_media/view/widgets/add_post_dialog.dart';
import 'package:fake_media/view/screens/post_details_screen.dart';
import 'package:fake_media/view/widgets/post_card.dart';
import 'package:fake_media/controllers/user_controller.dart';
import 'package:fake_media/response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostController postController = Get.put(PostController());
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    postController.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fake Media',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (postController.requestStatus.value == Status.loading) {
          return const Loader();
        } else if (postController.requestStatus.value == Status.error) {
          return ErrorText(error: postController.errorMessage.value);
        }

        return ListView.builder(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            final post = postController.posts[index];
            return GestureDetector(
                onTap: () {
                  postController.postId.value = post.postId;
                  Get.to(() => PostDetailsScreen());
                },
                child: PostCard(post: post, userController: userController));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return AddPostDialog();
          });
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
