import 'package:get/get.dart';

import 'navigation_arguments.dart';

mixin NavigationManager on GetxController {
  final _navigateToWithArgs = Rx<NavigationArguments>(const NavigationArguments(''));
  Stream<NavigationArguments> get navigateToWithArgsStream => _navigateToWithArgs.stream;
  set navigateToWithArgs(NavigationArguments value) => _navigateToWithArgs.subject.add(value);

  final _navigateToWithArgsAndClearStack = Rx<NavigationArguments>(const NavigationArguments(''));
  Stream<NavigationArguments> get navigateToWithArgsAndClearStackStream => _navigateToWithArgsAndClearStack.stream;
  set navigateToWithArgsAndClearStack(NavigationArguments value) => _navigateToWithArgsAndClearStack.subject.add(value);
}
