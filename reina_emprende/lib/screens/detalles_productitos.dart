import 'package:flutter/material.dart';

class DetallesScreen extends StatelessWidget {
  final String usuario;
  final String mensaje;

  const DetallesScreen({
    super.key,
    required this.usuario,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalle del producto',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              usuario,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              mensaje,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
