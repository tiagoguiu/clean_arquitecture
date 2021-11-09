import '../helpers.dart';

enum UiError {
  requiredField,
  invalidField,
  no_error,
  unexpected,
  invalidCredentials,
  emailInUse,
}

extension UiErrorExtension on UiError {
  String get description {
    switch (this) {
      case UiError.invalidCredentials:
        return R.strings.invalidCredentials;
      case UiError.requiredField:
        return R.strings.msgRequiredField;
      case UiError.invalidField:
        return R.strings.invalidfield;
      case UiError.no_error:
        return R.strings.allRight;
      case UiError.emailInUse:
        return R.strings.emailInUse;
      default:
        return R.strings.somethingWrong;
    }
  }
}
