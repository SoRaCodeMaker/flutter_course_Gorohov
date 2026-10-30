import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_course/homeworks/hw5/ui/screens/auth_screen.dart';
import 'package:flutter_course/homeworks/hw5/ui/screens/catalog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Hw5App());
}

class Hw5App extends StatelessWidget {
  const Hw5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW5 Firebase',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 242, 242),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            return const CatalogScreen();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
