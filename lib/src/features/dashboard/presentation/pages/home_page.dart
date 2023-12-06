import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/dashboard/data/models/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuizWidget(),
    );
  }
}

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex = 0;
  int score = 0;
  late String playerName;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => promptForName(context));
  }

  Future<void> promptForName(BuildContext context) async {
    TextEditingController nameController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingrese su nombre'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Nombre"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                playerName = nameController.text.trim();
                if (playerName.isNotEmpty) {
                  Navigator.of(context).pop();
                } else {}
              },
            ),
          ],
        );
      },
    );
  }

  void answerQuestion(bool isCorrect) async {
    if (isCorrect) {
      setState(() {
        score++;
      });

      await savePlayerData(playerName, score);
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex < questions.length) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_quiz.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[currentQuestionIndex].questionText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: Text(questions[currentQuestionIndex].option1),
                onPressed: () {
                  answerQuestion(questions[currentQuestionIndex].option1 ==
                      questions[currentQuestionIndex].correctAnswer);
                },
              ),
              ElevatedButton(
                child: Text(questions[currentQuestionIndex].option2),
                onPressed: () {
                  answerQuestion(questions[currentQuestionIndex].option2 ==
                      questions[currentQuestionIndex].correctAnswer);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fuegos.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Puntaje Final: $score',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: const Text('Reiniciar Quiz'),
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

List<Question> questions = [
  Question(
    questionText: '¿Qué es Dart?',
    option1: 'Un sistema operativo',
    option2: 'Un lenguaje de programación',
    correctAnswer: 'Un lenguaje de programación',
  ),
  Question(
    questionText:
        'En Dart, ¿qué palabra clave se utiliza para definir una clase?',
    option1: 'class',
    option2: 'object',
    correctAnswer: 'class',
  ),
  Question(
    questionText:
        '¿Qué característica de la POO permite que una clase adquiera propiedades y métodos de otra clase?',
    option1: 'Encapsulamiento',
    option2: 'Herencia',
    correctAnswer: 'Herencia',
  ),
  Question(
    questionText:
        'En Dart, ¿cómo se declara una función que no devuelve ningún valor?',
    option1: 'void functionName()',
    option2: 'int functionName()',
    correctAnswer: 'void functionName()',
  ),
  Question(
    questionText:
        'En una clase Dart, ¿cómo se llama al método especial que se invoca al crear una instancia de esa clase?',
    option1: 'inicializador',
    option2: 'constructor',
    correctAnswer: 'constructor',
  ),
  Question(
    questionText: '¿Qué es Flutter?',
    option1: 'Un lenguaje de programación',
    option2: 'Un SDK para desarrollo de aplicaciones móviles',
    correctAnswer: 'Un SDK para desarrollo de aplicaciones móviles',
  ),
  Question(
    questionText: 'En Flutter, todo en la interfaz de usuario es un...',
    option1: 'Objeto',
    option2: 'Widget',
    correctAnswer: 'Widget',
  ),
  Question(
    questionText: '¿Cuál es el patrón de diseño principal de Flutter?',
    option1: 'MVC (Model-View-Controller)',
    option2: 'Declarativo',
    correctAnswer: 'Declarativo',
  ),
  Question(
    questionText:
        '¿Qué widget en Flutter se utiliza comúnmente para implementar layouts de fila y columna?',
    option1: 'Container',
    option2: 'Row/Column',
    correctAnswer: 'Row/Column',
  ),
  Question(
    questionText:
        '¿Qué característica distintiva de Flutter permite ver los cambios en la UI casi instantáneamente durante el desarrollo?',
    option1: 'Hot Reload',
    option2: 'Fast Refresh',
    correctAnswer: 'Hot Reload',
  ),
];

Future<void> savePlayerData(String name, int score) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String scoresStr = prefs.getString('scores') ?? '{}';
  Map<String, dynamic> scores = json.decode(scoresStr);

  scores[name] = score;

  await prefs.setString('scores', json.encode(scores));
}
