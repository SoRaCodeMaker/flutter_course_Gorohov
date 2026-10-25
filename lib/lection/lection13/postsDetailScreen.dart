import 'package:flutter/material.dart';
import 'package:flutter_course/lection/lection13/Posts.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;
  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(post.title),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Вернуться в каталог'),
            ),
          ],
        ),
      ),
    );
  }
}
