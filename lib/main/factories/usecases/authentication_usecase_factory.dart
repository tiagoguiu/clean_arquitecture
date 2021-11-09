


import '../factories.dart';
import '../../../data/usecases/authentication/remote_authentication.dart';
import '../../../domain/usecases/usecases.dart';



Authentication makeLoginAuthentication(){
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(), url: makeApiUrl('login'));
}