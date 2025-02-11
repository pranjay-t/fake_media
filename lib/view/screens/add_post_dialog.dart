import 'package:fake_media/controllers/post_controller.dart';
import 'package:fake_media/view/widgets/add_post_text_field.dart';
import 'package:flutter/material.dart';

class AddPostDialog extends StatefulWidget {
  const AddPostDialog({super.key});

  @override
  State<AddPostDialog> createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final PostController postController = PostController();

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
      title: Text(
        "Create New Post",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddPostTextField(controller: titleController, label: 'Title'),
          SizedBox(
            height: 10,
          ),
          AddPostTextField(controller: bodyController, label: 'content'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () => addPost(),
          child: Text(
            "Post",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
