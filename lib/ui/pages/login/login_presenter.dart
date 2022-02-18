import '../../../presentation/mixins/mixins.dart';
import '../../helpers/helpers.dart';

abstract class LoginPresenter {
  Stream<UiError> get emailErrorStream;
  Stream<UiError> get passwordErrorStream;
  Stream<UiError> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;
  Stream<NavigationArguments> get navigateToWithArgsStream;

  void validateEmail(String email);
  void validatePassword(String password);
  void auth();
  void goToSignUp();
}
