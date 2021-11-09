import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class EmailValidation extends Equatable implements FieldValidation {
  final String field;
  List get props => [field];

  EmailValidation(this.field);

  ValidationError validate(Map input) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = input[field].isNotEmpty != true || regex.hasMatch(input[field]);
    return isValid ? ValidationError.no_error : ValidationError.invalidField;
  }
}