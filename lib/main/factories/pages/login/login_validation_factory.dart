



import 'package:curso_manguinho/main/composites/composites.dart';

import '../../../builders/builders.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../../presentation/protocols/protocols.dart';


Validation makeLoginValidation(){
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations(){
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().min(3).build(),
  ];
}
//... spread operator
//BUILDER DESIGN PATTERN