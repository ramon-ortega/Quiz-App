part of 'navigation_bloc.dart';

abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigateToState extends NavigationState {
  final int index;

  NavigateToState({
    required this.index,
  });
}
