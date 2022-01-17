import 'package:get/get.dart';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/login/login_presenter.dart';
import '../protocols/protocols.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final SaveCurrentAccount saveCurrentAccount;
  final Validation validation;
  final Authentication authentication;

  String _email = '';
  String _password = '';
  var _emailError = Rx<UiError>(UiError.no_error);
  var _passwordError = Rx<UiError>(UiError.no_error);
  var _mainError = Rx<UiError>(UiError.no_error);
  var _navigateTo = RxString('');
  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<String> get navigateToStream => _navigateTo.stream;
  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get mainErrorStream => _mainError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  GetxLoginPresenter({
    required this.saveCurrentAccount,
    required this.validation,
    required this.authentication,
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField(field: 'password');
    _validateForm();
  }

  UiError _validateField({required String field}) {
    final formData = {'email': _email, 'password': _password};
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UiError.invalidField;
      case ValidationError.requiredField:
        return UiError.requiredField;
      default:
        return UiError.no_error;
    }
  }

  void _validateForm() {
    _isFormValid.value = (_emailError.value == UiError.no_error) &&
        (_passwordError.value == UiError.no_error) &&
        _email.isNotEmpty &&
        _password.isNotEmpty;
    //to do OBERSER GET DEVE TER SEU CONTEUDO ACESSADO POR .VALUE
  }

  Future<void> auth() async {
    try {
      _mainError.value = UiError.no_error;
      _isLoading.value = true;
      final account = await authentication.auth(AuthenticationParams(email: _email, password: _password));
      await saveCurrentAccount.save(account);
      _navigateTo.value = '/surveys';
//ESTA INFORMAÇÃO SERA PASSADA PARA UI, POIS ADICIONAR O FLUTTER NESTA CAMADA ENTRA EM DESCONFORMIDADE COM CLEAN ARQUITECTURE
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          _mainError.value = UiError.invalidCredentials;
          break;
        default:
          _mainError.value = UiError.unexpected;
      }
      _isLoading.value = false;
    }
  }

  void goToSignUp() {
    _navigateTo.value = '/signup';
  }
}
