import 'package:fake_media/controllers/post_controller.dart';
import 'package:fake_media/view/widgets/add_post_text_field.dart';
import 'package:flutter/material.dart';

/*
 A dialog for adding a new post. 
 This dialog contains text fields for the post title and content, and allows the user to submit a new post.
*/
class AddPostDialog extends StatefulWidget {
  const AddPostDialog({super.key});

  @override
  State<AddPostDialog> createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  // Controller for the title input field.
  final TextEditingController titleController = TextEditingController();

  // Controller for the content input field.
  final TextEditingController bodyController = TextEditingController();

  // PostController instance to handle post creation.
  final PostController postController = PostController();

  // Adds a new post if both fields are not empty.
  void addPost() {
    if (titleController.text.isNotEmpty && bodyController.text.isNotEmpty) {
      postController.createPost(titleController.text, bodyController.text);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    titleController.clear();
    bodyController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Create New Post",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddPostTextField(controller: titleController, label: 'Title'),
          const SizedBox(height: 10),
          AddPostTextField(controller: bodyController, label: 'Content'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: addPost,
          child: const Text(
            "Post",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
