
import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../pages.dart';

class PasswordInput extends StatelessWidget {

  final LoginPresenter presenter;

  const PasswordInput({required this.presenter}); 

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UiError>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'Senha',
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColorLight,
              ),
              errorText: snapshot.hasData && snapshot.data != UiError.no_error ?  snapshot.data?.description : null,
            ),
            keyboardType: TextInputType.name,
            obscureText: true,
            //O ONCHANGED JA RETORNA COMO STRING O CAMPO MUDADO ENTÃO NAO PRECISA PASSAR A STRING PASSWORD
            onChanged: presenter.validatePassword,
          );
        });
  }
}
