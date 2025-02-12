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

// Screen that displays the details of a specific post, including its content and associated comments.
class PostDetailsScreen extends StatefulWidget {
  // Constructor for [PostDetailsScreen].
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  // Controller for managing post-related data.
  final PostController postController = Get.put(PostController());

  // Controller for managing user-related data.
  final UserController userController = Get.put(UserController());

  // The ID of the post being displayed.
  late String postId;

  @override
  void initState() {
    // Initialize the post ID from the controller and fetch post details and comments.
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
        // Display a loading indicator while fetching data.
        if (postController.requestStatus.value == Status.loading) {
          return const Loader();
        } 
        // Show an error message if there is an issue fetching data.
        else if (postController.requestStatus.value == Status.error) {
          return ErrorText(error: postController.errorMessage.value);
        }

        // Retrieve the post details using the post ID.
        final PostModel? post = postController.postById[postId];
        if (post == null) {
          return const Loader();
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the post details.
                PostCard(post: post, userController: userController),
                
                // Section title for comments.
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
                
                // Display the list of comments related to the post.
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: postController.comments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final comment = postController.comments[index];
                    return CommentCard(
                      name: comment.name,
                      content: comment.content,
                    );
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
