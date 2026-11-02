import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? error;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Вход
  Future<void> _signIn() async {
    setState(() {
      error = null;
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => error = e.code);
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  // Регистрация
  Future<void> signUp() async {
    if (passwordController.text.trim().length < 6) {
      setState(() => error = 'Пароль должен быть не менее 6 символов');
      return;
    }

    setState(() {
      error = null;
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => error = e.code);
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              'МОЙ ТОП АНИМЕ',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'test@mail.ru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Пароль',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Ошибка: $error',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed: isLoading ? null : _signIn,
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Войти'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: isLoading ? null : signUp,
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
