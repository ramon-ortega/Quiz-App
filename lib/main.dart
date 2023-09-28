import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/features/dashboard/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:quiz_app/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:quiz_app/src/features/welcome/presentation/pages/welcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()),
        ],
        child: MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          routes: {
            '/welcome': (_) => const WelcomePage(),
            '/dashboard': (_) => const DashboardPage(),
          },
          initialRoute: '/welcome',
        ));
  }
}
