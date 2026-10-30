import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_course/homeworks/hw6/bloc/anime_bloc.dart';
import 'package:flutter_course/homeworks/hw6/bloc/anime_event.dart';
import 'package:flutter_course/homeworks/hw6/ui/screens/auth_screen.dart';
import 'package:flutter_course/homeworks/hw6/ui/screens/catalog_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Hw6App());
}

class Hw6App extends StatelessWidget {
  const Hw6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW6 Firebase',
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
            return BlocProvider(
              create: (_) => AnimeBloc()..add(AnimeLoadRequested()),
              child: const CatalogScreen(),
            );
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
