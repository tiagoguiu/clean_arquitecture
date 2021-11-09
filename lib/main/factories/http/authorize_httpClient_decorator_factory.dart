import '../../../data/http/http.dart';
import '../../decorators/decorators.dart';
import '../factories.dart';

HttpClient makeAuthorizedHttpClientDecorator() => AuthorizeHttpClientDecorator(
      deleteCacheStorage: makeSecureStorageAdapter(),
      fetchSecureFetchStorage: makeSecureStorageAdapter(),
      decoratee: makeHttpAdapter(),
    );
