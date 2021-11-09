import 'package:get/get.dart';

import '../../ui/helpers/helpers.dart';

mixin ErrorManager on GetxController {
  final _error = Rx<UiError>(UiError.no_error);
  Stream<UiError> get surveysErrorStream => _error.stream;
  set addError(UiError value) => _error.value = value;
}
