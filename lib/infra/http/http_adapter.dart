import 'dart:convert';

import 'package:http/http.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({required this.client});

  Future<dynamic> request({
    required String url,
    required String method,
    Map body = const {},
    Map<String, String> headers = const {},
    List<Map<String, dynamic>> files = const [],
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final defaultHeaders = headers
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
      });

    final jsonBody = jsonEncode(body);
    //por causa do null safety body nunca pode ser null, comparação desnecessaria
    //final jsonBody = jsonEncode(body);

    var response = Response('', 500);

    try {
      if (method == 'post') {
        response =
            await client.post(Uri.parse(url), headers: defaultHeaders, body: jsonBody).timeout(Duration(seconds: 5));
      } else if (method == 'get') {
        response = await client.get(Uri.parse(url), headers: defaultHeaders).timeout(Duration(seconds: 5));
      } else if (method == 'put') {
        response =
            await client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody).timeout(Duration(seconds: 5));
      }
    } catch (e) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body.isEmpty ? {} : jsonDecode(response.body);
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
