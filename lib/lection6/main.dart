import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 50, child: CircleAvatar(child: Text('A'))),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Фамилия и Имя'),
                  Text(
                    'Куча бредового текста чтобы было',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text('20:31'),
          ],
        ),
      ),
    );
  }
}
