import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../../../data/http/http.dart';
import '../../../infra/http/http.dart';
import 'http.dart';

HttpClient makeHttpAdapter() {
  final Client client = InterceptedClient.build(
    interceptors: [
      HttpInterceptor(),
    ],
  );

  return HttpAdapter(client: client);
}
