import 'package:equatable/equatable.dart';

class NavigationArguments extends Equatable {
  final String route;
  final Map<String, dynamic>? arguments;

  /// Clear the entire stack of pages
  final bool clearStack;

  /// Replace the current page
  final bool replace;

  const NavigationArguments(
    this.route, {
    this.arguments,
    this.clearStack = false,
    this.replace = false,
  });

  @override
  List<Object?> get props => [route, arguments];
}
