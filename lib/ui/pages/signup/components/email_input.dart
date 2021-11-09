import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../signup_presenter.dart';

class EmailSignUpInput extends StatelessWidget {
  final SignUpPresenter presenter;

  EmailSignUpInput({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UiError>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: R.strings.email,
              icon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColorLight,
              ),
              errorText: snapshot.hasData && snapshot.data != UiError.no_error ?  snapshot.data?.description : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
          );
        });
  }
}
