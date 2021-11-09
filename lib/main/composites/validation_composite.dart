
import '../../presentation/protocols/protocols.dart';
import '../../validation/protocols/protocols.dart';

class ValidationComposite implements Validation{

  final List<FieldValidation> validations;

  ValidationComposite(this.validations);
  ValidationError validate({required String field, required Map input}) {
    ValidationError error = ValidationError.no_error;
    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(input);
      if(error != ValidationError.no_error){
        return error;
      }
    }
    return error;
  }
}
