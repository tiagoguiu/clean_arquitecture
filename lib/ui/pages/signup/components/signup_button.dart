import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../signup_presenter.dart';

class SignUpButton extends StatelessWidget {
  final SignUpPresenter presenter;

  const SignUpButton({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.signUp : null,
            child: Text(R.strings.addAccount.toUpperCase()),
          );
        });
  }
}
