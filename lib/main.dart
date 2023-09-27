import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/presentation/pages/welcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (_) => const WelcomePage(),
      },
      initialRoute: '/welcome',
    );
  }
}
