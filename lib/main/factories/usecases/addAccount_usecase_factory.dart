import '../../../data/usecases/add_account/add_account.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

AddAccount makeRemoteAddAccount() {
  return RemoteAddAccount(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('signup'),
  );
}
