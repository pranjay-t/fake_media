import 'package:fake_media/common/error_text.dart';
import 'package:fake_media/common/loader.dart';
import 'package:fake_media/controllers/post_controller.dart';
import 'package:fake_media/view/widgets/comment_card.dart';
import 'package:fake_media/view/widgets/post_card.dart';
import 'package:fake_media/controllers/user_controller.dart';
import 'package:fake_media/models/post_model.dart';
import 'package:fake_media/response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final PostController postController = Get.put(PostController());
  final UserController userController = Get.put(UserController());
  late String postId;

  @override
  void initState() {
    postId = postController.postId.value!;
    super.initState();
    postController.fetchPostById(postId);
    postController.fetchCommentsByPostId(postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail Screen'),
      ),
      body: Obx(() {
        if (postController.requestStatus.value == Status.loading) {
          return const Loader();
        } else if (postController.requestStatus.value == Status.error) {
          return ErrorText(error: postController.errorMessage.value);
        }

        final PostModel? post = postController.postById[postId];
        if (post == null) {
          return const Loader();
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostCard(post: post, userController: userController),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: postController.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final comment = postController.comments[index];
                    return CommentCard(name: comment.name,content: comment.content,);
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
