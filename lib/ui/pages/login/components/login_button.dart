

import 'package:flutter/material.dart';

import '../../pages.dart';

class LoginButton extends StatelessWidget {
 
  final LoginPresenter presenter;

  const LoginButton({required this.presenter});


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.auth : null,
            child: Text('Entrar'.toUpperCase()),
          );
        });
  }
}
