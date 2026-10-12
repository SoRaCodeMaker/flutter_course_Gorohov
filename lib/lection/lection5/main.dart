import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const center = Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 12,
        children: [
          Icon(Icons.share, color: Colors.blue),
          Icon(Icons.sms, color: Colors.green),
          Icon(Icons.favorite, color: Colors.yellow),
          Icon(Icons.delete, color: Colors.red),
        ],
      ),
    );
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
