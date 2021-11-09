import '../../../data/usecases/save_current_account/local_save_current_account.dart';
import '../../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveCurrentAccount makeLocalSaveAccount() {
  return LocalSaveCurrentAccount(saveSecureCacheStorage: makeSecureStorageAdapter());
}
