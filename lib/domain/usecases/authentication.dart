import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable{
  final String? email;
  final String? password;

  @override
  List get props => [email, password];

  AuthenticationParams({@required this.email, @required this.password});

  
}
/*A IMPLEMENTAÇÃO DESTE CASO DE USO IRA FICAR NA CAMADA SUPERIOR,
OU SEJA ESTA PARTE SERVIRA APENAS COMO UMA INTERFACE
*/

/* tres niveis de import:
1 imports do dart
2 imports de pacotes de terceiros
3 imports próprios
*/
