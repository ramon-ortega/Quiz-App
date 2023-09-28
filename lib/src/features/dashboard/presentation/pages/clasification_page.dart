import 'package:flutter/material.dart';

class ClasificationPage extends StatelessWidget {
  const ClasificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificación'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
      ),
    );
  }
}
