import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_event.dart';
import 'package:flutter_course/projects/Attestation_1/data/anime_repository.dart';
import 'package:flutter_course/projects/Attestation_1/ui/screens/auth_screen.dart';
import 'package:flutter_course/projects/Attestation_1/ui/screens/catalog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Attestation());
}

class Attestation extends StatelessWidget {
  const Attestation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attestation 1',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 243, 242, 242),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AnimeBloc(AnimeRepository())..add(AnimeLoadRequested()),
        child: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
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
    );
  }
}
