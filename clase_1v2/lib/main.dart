import 'package:flutter/material.dart';
import 'package:clase_1v2/screens/splashscreen.dart';
import 'package:clase_1v2/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light, // Usa el tema claro
      darkTheme: AppTheme.dark, // Usa el tema oscuro
      themeMode: ThemeMode.system, // Cambia según la configuración del sistema
      home: const SplashScreen(),
    );
}//Widget
}//MyApp

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('paralelepipedo')
          ],
        ),
      )
    );
  }
}//HomeScreen
