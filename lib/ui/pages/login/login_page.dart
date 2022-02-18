import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import 'components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget with KeyboardManager, LoadingManager, NavigationManager{
  final LoginPresenter presenter;

  LoginPage({required this.presenter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with NavigationManager{
  @override
  void initState() {
    widget.handleLoading(context, widget.presenter.isLoadingStream);

    widget.presenter.mainErrorStream.listen((error) {
      showErrorMessage(context, error.description);
    });


    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //CLICAR FORA PARA ESCONDER TECLADO

    return Scaffold(
      body: GestureDetector(
        onTap: () => widget.hideKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginHeader(),
              HeadLine1(
                text: "Login",
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Provider(
                  create: (_) => widget.presenter,
                  builder: (context, _) => Form(
                    child: Column(
                      children: [
                        //EMAIL
                        EmailInput(
                          presenter: widget.presenter,
                        ), //campo login em components
                        //SENHA
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                          child: PasswordInput(
                            presenter: widget.presenter,
                          ), //campo senha em components
                        ),
                        //botão de login em components
                        LoginButton(
                          presenter: widget.presenter,
                        ),
                        TextButton.icon(
                          onPressed: widget.presenter.goToSignUp,
                          icon: Icon(Icons.person),
                          label: Text(R.strings.addAccount), //pegando da tradução
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
