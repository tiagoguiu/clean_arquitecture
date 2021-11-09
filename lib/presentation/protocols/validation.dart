

abstract class Validation {
  ValidationError validate({required String field, required Map input});
}

enum ValidationError {
  no_error,
  requiredField,
  invalidField,
}