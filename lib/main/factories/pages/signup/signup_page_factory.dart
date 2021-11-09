


import 'package:flutter/material.dart';


import '../../factories.dart';
import '../../../../ui/pages/pages.dart';



Widget makeSignUpPage(){
  return SignUpPage(presenter: makeGetxSignUpPresenter());
}
//COMPOSIÇÃO PARA USAR GETX SÓMENTE TROCAR GETX POR STREAMS