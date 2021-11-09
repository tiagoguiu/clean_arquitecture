import '../../data/cache/cache.dart';
import '../../data/http/http.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final FetchSecureCacheStorage fetchSecureFetchStorage;
  final HttpClient decoratee;
  final DeleteCacheStorage deleteCacheStorage;

  AuthorizeHttpClientDecorator({
    required this.fetchSecureFetchStorage,
    required this.decoratee,
    required this.deleteCacheStorage,
  });
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map<String, String>? headers,
  }) async {
    try {
      final token = await fetchSecureFetchStorage.fetch(key: 'token');
      final authorizedHeaders = headers ?? {}
        ..addAll({'x-access-token': token});
      return await decoratee.request(url: url, method: method, body: body, headers: authorizedHeaders);
    } catch (error) {
      if (error is HttpError && error != HttpError.forbidden) {
        rethrow;
      } else {
        await deleteCacheStorage.delete(key: 'token'); 
        throw HttpError.forbidden;
      }
    }
  }
}
