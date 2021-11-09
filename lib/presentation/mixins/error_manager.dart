import 'package:curso_manguinho/ui/helpers/helpers.dart';
import 'package:get/get.dart';

mixin ErrorManager on GetxController {
  final _error = Rx<UiError>(UiError.no_error);
  Stream<UiError> get surveysErrorStream => _error.stream;
  set addError(UiError value) => _error.value = value;
}