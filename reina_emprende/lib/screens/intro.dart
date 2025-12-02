import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:reina_emprende/main.dart';
import 'package:reina_emprende/screens/login.dart'; // Para HomeScreen

// Configuracion inicio sesion google

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool loading = false;

  Future<User?> _signInWithGoogle() async {
    try {
      setState(() => loading = true);

      await GoogleSignIn.instance.initialize();

      final googleUser = await GoogleSignIn.instance.authenticate();
      // ignore: unrelated_type_equality_checks
      if (googleUser == false) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al iniciar sesión: $e')));
      }
      return null;
    } finally {
      setState(() => loading = false);
    }
  }

  void login() async {
    final user = await _signInWithGoogle();
    if (user != null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const azulClaro = Color.fromARGB(255, 21, 146, 241);
    const azulOscuro = Color.fromARGB(255, 75, 64, 227);
    final width = MediaQuery.of(context).size.width;
    const cardHeight = 180.0;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 120, color: Colors.grey),

            const SizedBox(height: 12),

            const Text(
              "¿Qué quieres hacer hoy?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 32),

            InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },

            child: Container(
              width: width * 0.8,
              height: cardHeight,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: azulClaro, width: 2),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.store, size: 50, color: azulClaro),
                  SizedBox(width: 12),
                  Text(
                    "Iniciar como Vendedor",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            ),

            const SizedBox(height: 30),


          InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },
            child: Container(
              width: width * 0.8,
              height: cardHeight,
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: azulOscuro, width: 2),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, size: 50, color: azulOscuro),
                  SizedBox(width: 12),
                  Text(
                    "Iniciar como comprador",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

            const SizedBox(height: 40),

            const Text(
              "Iniciar como invitado",
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}