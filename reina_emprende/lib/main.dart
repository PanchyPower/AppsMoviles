import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:reina_emprende/screens/splash.dart';
import 'package:reina_emprende/screens/login.dart';
import 'package:reina_emprende/screens/intro.dart';
import 'package:reina_emprende/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAx4Bvoum0MA_apA9LE0miozdjKNfw4S9w",
        authDomain: "reina-emprende.firebaseapp.com",
        projectId: "reina-emprende",
        storageBucket: "reina-emprende.firebasestorage.app",
        messagingSenderId: "679277996918",
        appId: "1:679277996918:web:23460cffe8b438703c6857"
      ),
    );
  } on FirebaseException catch (e) {
    // Si la app ya estaba inicializada, ignora el error
    if (e.code != 'duplicate-app') rethrow;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _signOut(BuildContext context) async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),

            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: const IntroScreen(),
    );
  }
}
