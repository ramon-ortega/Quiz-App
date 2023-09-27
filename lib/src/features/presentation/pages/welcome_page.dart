import 'package:flutter/material.dart';

import '../widgets/gradient_circle.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 26, 95, 1),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            GradientCircle(
              offset: Offset(size.width * 0.7, -10),
              size: 180,
            ),
            GradientCircle(
              offset: Offset(size.width * 0.10, size.height * 0.86),
            ),
            const GradientCircle(
              offset: Offset(-10, -10),
              size: 140,
            ),
            const _Body()
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: const Text(
              'Pon a prueba tus conocimientos en programación con este quiz de lenguajes de programación!',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.75,
            height: size.width * 0.75,
            child: Image.asset('assets/hacker.png'),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          SizedBox(
            width: size.width * 0.66,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(65, 229, 237, 1),
                foregroundColor: const Color.fromRGBO(29, 26, 95, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Empezar a Jugar'),
            ),
          )
        ],
      ),
    );
  }
}
