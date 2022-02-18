import '../../../presentation/mixins/mixins.dart';
import '../../helpers/helpers.dart';

abstract class SignUpPresenter {
  Stream<UiError> get emailErrorStream;
  Stream<UiError> get nameErrorStream;
  Stream<UiError> get passwordErrorStream;
  Stream<UiError> get passwordConfirmErrorStream;
  Stream<UiError> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<NavigationArguments> get navigateToWithArgsStream;


  void validateName(String name);
  void validateEmail(String email);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);
  void signUp();
  void goToLogin();
}
