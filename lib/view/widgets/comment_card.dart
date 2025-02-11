import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String name;
  final String content;
  const CommentCard({
    super.key, required this.name, required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  radius: 18,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        content,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 188, 186, 186)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.reply),
              ),
              const Text('Reply'),
            ],
          ),
        ],
      ),
    );
  }
}
