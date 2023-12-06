import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClasificationPage extends StatelessWidget {
  const ClasificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificación'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clasif.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<Map<String, int>>(
          future: getSavedScores(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final scores = snapshot.data!;
              return ListView.separated(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  String name = scores.keys.elementAt(index);
                  int score = scores[name]!;
                  return ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Ajusta el tamaño según tus preferencias
                      ),
                    ),
                    trailing: Text(
                      score.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Ajusta el tamaño según tus preferencias
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(); // Divider entre elementos
                },
              );
            } else {
              return const Center(
                child: Text('Aún no se ha jugado.'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, int>> getSavedScores() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String scoresStr = prefs.getString('scores') ?? '{}';
    Map<String, dynamic> scoresDynamic = json.decode(scoresStr);

    Map<String, int> scores = scoresDynamic
        .map((key, value) => MapEntry(key, (value as num).toInt()));

    return scores;
  }
}
