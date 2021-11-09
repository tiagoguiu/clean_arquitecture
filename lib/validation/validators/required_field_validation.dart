import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;
  List get props => [field];
  RequiredFieldValidation({required this.field});
  ValidationError validate(Map input) {
    return input[field].isNotEmpty == true ? ValidationError.no_error : ValidationError.requiredField;
  }
}
