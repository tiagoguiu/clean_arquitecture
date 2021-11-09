
import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../signup_presenter.dart';

class ConfirmPasswordInput extends StatelessWidget {

  final SignUpPresenter presenter;

  const ConfirmPasswordInput({required this.presenter}); 

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UiError>(
        stream: presenter.passwordConfirmErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: R.strings.confirmPassword,
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
              errorText: snapshot.hasData && snapshot.data != UiError.no_error ?  snapshot.data?.description : null,
            ),
            keyboardType: TextInputType.name,
            obscureText: true,
            //O ONCHANGED JA RETORNA COMO STRING O CAMPO MUDADO ENTÃO NAO PRECISA PASSAR A STRING PASSWORD
            onChanged: presenter.validatePasswordConfirmation,
          );
        });
  }
}
