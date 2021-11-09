import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';

class SecureStorageAdapter implements SaveSecureCacheStorage, FetchSecureCacheStorage , DeleteCacheStorage{
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});

  Future<void> save({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String> fetch({required String key}) async {
    String? secure = await secureStorage.read(key: key);
    return secure ?? '';
  }

  Future<void> delete({required String key}) async {
    await secureStorage.delete(key: key);
  }

}
