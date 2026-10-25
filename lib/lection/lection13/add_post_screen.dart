import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/lection/lection13/Posts.dart';
import 'package:flutter_course/lection/lection13/main.dart';
import 'package:http/http.dart' as http;

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  Future<Post?> createPost(Post post) async {
    final url = Uri.parse('$baseUrl/postss');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return null;
      // throw Exception('Статус ${response.statusCode} ${response.body}');
    }
    return Post.fromJson(jsonDecode(response.body));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Заголовок',
                hintText: 'Введите заголовок',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Описание',
                hintText: 'Введите описание',
              ),
              controller: bodyController,
            ),
            ElevatedButton(
              onPressed: () async {
                print(titleController.text);
                print(bodyController.text);

                final post = await createPost(
                  Post(
                    id: '',
                    userId: 99,
                    title: titleController.text,
                    body: bodyController.text,
                  ),
                );
                // setState(() {
                //   posts.add(post);
                // });
                titleController.clear();
                bodyController.clear();
                if (!mounted) return;

                if (post == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    // 4
                    SnackBar(content: Text('Произошла ошибка')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    // 4
                    SnackBar(content: Text('Создан пост ${post.id}')),
                  );
                }
                if (mounted) Navigator.pop(context, post);
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
