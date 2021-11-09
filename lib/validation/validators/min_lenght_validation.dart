import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class MinLengthValidation extends Equatable implements FieldValidation {
  final String field;
  final int size;

  List get props => [field, size];

  MinLengthValidation({
    required this.field,
    required this.size,
  });


  ValidationError validate(Map input){
    return input[field].length >= size ? ValidationError.no_error : ValidationError.invalidField;
  }
}