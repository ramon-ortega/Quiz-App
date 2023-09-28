part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class NavigateToIndex extends NavigationEvent {
  final int index;

  NavigateToIndex({
    required this.index,
  });
}
