import '/../data/http/http.dart';
import '../../domain/entities/entities.dart';

class RemoteAccountModel {
  final String accessToken;
  //refletindo o que vira da api

  RemoteAccountModel(this.accessToken);

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }
    return RemoteAccountModel(json['accessToken']);
  }

//necessario fazer a classe se transformar em um account entity pelo retorno do metodo auth
  AccountEntity toEntity() => AccountEntity(accessToken);
}
