import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String token;

  @override
  List get props => [token];

  AccountEntity(this.token);
  //SE NO FUTURO A RESPOSTA DO USE CASE FOR MUDAR BASTA
  //ADICIONAR AQUI DENTRO

//detalhes do http dentro de entidade do dominio, logo está errado
//  factory AccountEntity.fromJson(Map json) =>
//      AccountEntity(json['accessToken']);
//metodo esta retornando uma instancia de accountEntity pegando dentro do json o campo accesToken

}
