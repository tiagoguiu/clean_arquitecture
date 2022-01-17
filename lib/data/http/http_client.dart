abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required String method,
    Map body = const {},
    Map<String, String> headers = const {},
    List<Map<String, dynamic>> files = const [],
    Map<String, dynamic> queryParameters = const {},
  });
}
