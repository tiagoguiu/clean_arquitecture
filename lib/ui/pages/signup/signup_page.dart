import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import 'components/components.dart';
import 'signup_presenter.dart';

class SignUpPage extends StatefulWidget with KeyboardManager, LoadingManager, NavigationManager {
  final SignUpPresenter presenter;

  SignUpPage({required this.presenter});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with NavigationManager {
  @override
  void initState() {
    super.initState();
    widget.handleLoading(context, widget.presenter.isLoadingStream);

    widget.presenter.mainErrorStream.listen((error) {
      showErrorMessage(context, error.description);
    });

    handleNavigationWithArgs(widget.presenter.navigateToWithArgsStream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => widget.hideKeyboard(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginHeader(),
              HeadLine1(
                text: R.strings.addAccount,
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Provider(
                  create: (_) => widget.presenter,
                  builder: (context, _) => Form(
                    child: Column(
                      children: [
                        //EMAIL
                        NameInput(
                          presenter: widget.presenter,
                        ), //campo login em components
                        //SENHA
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: EmailSignUpInput(
                            presenter: widget.presenter,
                          ), //campo senha em components
                        ),
                        PasswordSignUpInput(presenter: widget.presenter),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                          child: ConfirmPasswordInput(
                            presenter: widget.presenter,
                          ), //campo senha em components
                        ),
                        //botão de login em components
                        SignUpButton(
                          presenter: widget.presenter,
                        ),
                        TextButton.icon(
                          onPressed: widget.presenter.goToLogin,
                          icon: Icon(Icons.exit_to_app),
                          label: Text(R.strings.login), //pegando da tradução
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
