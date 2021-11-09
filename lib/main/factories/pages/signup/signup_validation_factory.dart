



import 'package:curso_manguinho/main/composites/composites.dart';

import '../../../builders/builders.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../../presentation/protocols/protocols.dart';

Validation makeSignUpValidation(){
  return ValidationComposite(makeSignUpValidations());
}

List<FieldValidation> makeSignUpValidations(){
  return [
    ...ValidationBuilder.field('name').required().min(3).build(),
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().min(3).build(),
    ...ValidationBuilder.field('passwordConfirmation').required().sameAs('password').build(),
  ];
}
//... spread operator
//BUILDER DESIGN PATTERN