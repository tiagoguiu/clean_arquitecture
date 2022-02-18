import 'package:get/get.dart';

import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';
import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController with NavigationManager implements SignUpPresenter {
  final SaveCurrentAccount saveCurrentAccount;
  final Validation validation;
  final AddAccount addAccount;

  String _email = '';
  String _password = '';
  String _name = '';
  String _passwordConfirmation = '';

  var _emailError = Rx<UiError>(UiError.no_error);
  var _passwordError = Rx<UiError>(UiError.no_error);
  var _mainError = Rx<UiError>(UiError.no_error);
  var _nameError = Rx<UiError>(UiError.no_error);
  var _passwordConfirmError = Rx<UiError>(UiError.no_error);

  var _isFormValid = false.obs;
  var _isLoading = false.obs;

  Stream<UiError> get emailErrorStream => _emailError.stream;
  Stream<UiError> get mainErrorStream => _mainError.stream;
  Stream<UiError> get passwordErrorStream => _passwordError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<UiError> get nameErrorStream => _nameError.stream;
  Stream<UiError> get passwordConfirmErrorStream => _passwordConfirmError.stream;

  GetxSignUpPresenter({
    required this.saveCurrentAccount,
    required this.validation,
    required this.addAccount,
  });

  //void validatePasswordConfirmation(String passwordConfirmation){}
  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email');
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField(field: 'name');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField(field: 'password');
    _validateForm();
  }

  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    _passwordConfirmError.value = _validateField(field: 'passwordConfirmation');
    _validateForm();
  }

  UiError _validateField({required String field}) {
    final formData = {
      'name': _name,
      'email': _email,
      'password': _password,
      'passwordConfirmation': _passwordConfirmation,
    };
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
        (_nameError.value == UiError.no_error) &&
        (_passwordConfirmError.value == UiError.no_error) &&
        _email.isNotEmpty &&
        _password.isNotEmpty;
    _name.isNotEmpty && _passwordConfirmation.isNotEmpty;
    //to do OBERSER GET DEVE TER SEU CONTEUDO ACESSADO POR .VALUE
  }

  Future<void> signUp() async {
    try {
      _mainError.value = UiError.no_error;
      _isLoading.value = true;
      final account = await addAccount.add(AddAccountParams(
        name: _name,
        email: _email,
        password: _password,
        passwordConfirmation: _passwordConfirmation,
      ));
      await saveCurrentAccount.save(account);
      navigateToWithArgs = NavigationArguments('/surveys');
//ESTA INFORMAÇÃO SERA PASSADA PARA UI, POIS ADICIONAR O FLUTTER NESTA CAMADA ENTRA EM DESCONFORMIDADE COM CLEAN ARQUITECTURE
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.emailInUse:
          _mainError.value = UiError.emailInUse;
          break;
        default:
          _mainError.value = UiError.unexpected;
      }
      _isLoading.value = false;
    }
  }

  void goToLogin() {
    navigateToWithArgs = NavigationArguments('/login');
  }
}
