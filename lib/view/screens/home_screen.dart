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

/// HomeScreen is the main screen that displays a list of posts.
/// It allows users to view posts, navigate to post details, and add new posts.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Controller for handling post-related operations.
  final PostController postController = Get.put(PostController());
  
  /// Controller for handling user-related operations.
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    // Fetches posts when the screen is initialized.
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
        // Displays a loading indicator while fetching data.
        if (postController.requestStatus.value == Status.loading) {
          return const Loader();
        } 
        // Displays an error message if fetching posts fails.
        else if (postController.requestStatus.value == Status.error) {
          return ErrorText(error: postController.errorMessage.value);
        }

        // Displays the list of posts if data is successfully fetched.
        return ListView.builder(
          itemCount: postController.posts.length,
          itemBuilder: (context, index) {
            final post = postController.posts[index];
            return GestureDetector(
              onTap: () {
                // Sets the selected post ID and navigates to the post details screen.
                postController.postId.value = post.postId;
                Get.to(() => PostDetailsScreen());
              },
              child: PostCard(post: post, userController: userController),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Opens a dialog to add a new post.
          showDialog(
            context: context, 
            builder: (context) {
              return AddPostDialog();
            }
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
