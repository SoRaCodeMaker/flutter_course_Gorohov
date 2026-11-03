import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I', style: TextStyle(color: Colors.red)),
              Icon(Icons.favorite, color: Colors.red),
              Text('Flutter', style: TextStyle(color: Colors.blue)),
              FlutterLogo(textColor: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
