import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/features/dashboard/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:quiz_app/src/features/dashboard/presentation/pages/categories_page.dart';
import 'package:quiz_app/src/features/dashboard/presentation/pages/clasification_page.dart';
import 'package:quiz_app/src/features/dashboard/presentation/pages/home_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final List<Widget> _screens = [
    const HomePage(),
    const CategoriesPage(),
    const ClasificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: ((context, state) {
        int _currentIndex = 0;

        if (state is NavigateToState) {
          _currentIndex = state.index;
        }

        return Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex,
          ),
        );
      }),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromRGBO(119, 143, 240, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        context.read<NavigationBloc>().add(
              NavigateToIndex(index: value),
            );
      },
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Screen 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list_rounded),
          label: 'Screen 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wysiwyg_rounded),
          label: 'Screen 3',
        ),
      ],
    );
  }
}
