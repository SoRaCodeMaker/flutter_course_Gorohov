import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/lection/lection13/Posts.dart';
import 'package:flutter_course/lection/lection13/postsDetailScreen.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://6ad0f325addc5b5cb142904b.mockapi.io';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          fillColor: const Color.fromARGB(255, 171, 218, 240),
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;
  String? error;

  List<Post> posts = [];

  Future<void> load() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode != 200) {
        throw Exception('Статус ${response.statusCode}');
      }

      final decoded = jsonDecode(response.body) as List;

      for (final el in decoded) {
        final post = Post.fromJson(el);
        posts.add(post);
      }

      setState(() => posts = decoded.map((e) => Post.fromJson(e)).toList());
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Создать пост'),
                  content: Text('Заполнить'),
                  actions: [
                    ElevatedButton(onPressed: () {}, child: Text('Отменить')),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Создать'),
                    ),
                  ],
                ),
              );
              // final post = await Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddPostScreen()),
              // );
              // if (!mounted) return;
              // if (post == null) return;
              // setState(() {
              //   posts.add(post);
              // });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              spacing: 10,
              children: [
                if (isLoading)
                  const CircularProgressIndicator()
                else if (error != null)
                  Text('Ошибка: $error')
                else if (posts.isEmpty)
                  Text('Данные не найдены'),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailsScreen(post: posts[index]),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(posts[index].id.toString()),
                          ),
                          title: Text(posts[index].title),
                          subtitle: Row(
                            children: [
                              Flexible(
                                child: Text(posts[index].body, maxLines: 1),
                              ),
                              Text(posts[index].userId.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
