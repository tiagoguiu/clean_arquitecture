/*
import 'dart:async';


import '../../domain/helpers/domain_error.dart';
import '../../ui/pages/login/login_presenter.dart';
import '../../domain/usecases/authentication.dart';
import '../protocols/protocols.dart';

class LoginState{
  late String email;
  late String password;
  late String emailError;
  late String passwordError;
  late String navigateTo;
  late String mainError;
  late bool isLoading = false;
  
  LoginState({this.emailError = 'no_error',this.passwordError = 'no_error', this.email = '', this.password = ''});

  bool get isFormValid => 
  emailError == 'no_error' && 
  passwordError == 'no_error' && 
  email.isNotEmpty && 
  password.isNotEmpty;

}

class StreamLoginPresenter implements LoginPresenter{


  final Validation validation;
  //broadcast aciona mais de um listener para o controlador
  var _controller = StreamController<LoginState>.broadcast();
  final Authentication authentication;

  var _state = LoginState();

//.distinct só emite valor se o novo valor for diferente do anterior
  Stream<String> get emailErrorStream => _controller.stream.map((state) => state.emailError).distinct();
  Stream<String> get mainErrorStream => _controller.stream.map((state) => state.mainError).distinct();
  //PARTE DE STREAM PARA NAVEGAÇÃO NÃO IMPEMENTADA, POIS JA ESTAMOS USANDO GETx
  Stream<String> get navigateToStream =>_controller.stream.map((state) => state.navigateTo).distinct();

  Stream<bool> get isFormValidStream => _controller.stream.map((state) => state.isFormValid).distinct();
//toda vez que alterar o formulario dispara um evento dentro do stream

  Stream<String> get passwordErrorStream => _controller.stream.map((state) => state.passwordError).distinct();
  
  Stream<bool> get isLoadingStream => _controller.stream.map((state) => state.isLoading).distinct();


//FIM DAS STREAMS
  StreamLoginPresenter({required this.validation,required this.authentication,});

  void _update () => _controller.add(_state);

  void validateEmail(String email) {
    _state.email = email;
    _state.emailError = validation.validate(field: 'email', value: email);
    _update();
  }

  void validatePassword(String password) {
    _state.password = password;
    _state.passwordError = validation.validate(field: 'password', value: password);
    _update();

  }

  Future<void> auth() async{
    _state.isLoading = true;
    _update();
    try {
      await authentication.auth(AuthenticationParams(email: _state.email, password: _state.password));
    } on DomainError catch (e) {
      _state.mainError = e.description;
    }
    _state.isLoading = false;
    _update();
  }
  void dispose(){
    _controller.close();
  }

}
*/