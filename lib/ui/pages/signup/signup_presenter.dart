import '../../helpers/helpers.dart';

abstract class SignUpPresenter {
  Stream<UiError> get emailErrorStream;
  Stream<UiError> get nameErrorStream;
  Stream<UiError> get passwordErrorStream;
  Stream<UiError> get passwordConfirmErrorStream;
  Stream<UiError> get mainErrorStream;
  Stream<String> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;


  void validateName(String name);
  void validateEmail(String email);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);
  void signUp();
  void goToLogin();
}
