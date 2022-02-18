import 'package:dio/dio.dart';

import '../../data/http/http.dart';

class DioAdapter implements HttpClient {
  final Dio client;

  DioAdapter({
    required this.client,
  });

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map body = const {},
    Map<String, String> headers = const {},
    List<Map<String, dynamic>> files = const [],
    Map<String, dynamic> queryParameters = const {},
  }) async {
    FormData? formData;
    if (files.isNotEmpty) {
      if (files.length == 1) {
        formData = FormData.fromMap({
          'file': MultipartFile.fromFileSync(
            files[0]['path'],
            filename: files[0]['fileName'],
          ),
        }..addAll(Map<String, dynamic>.from(body)));
      } else {
        formData = FormData.fromMap({
          'files': files
              .map(
                (file) => MultipartFile.fromFileSync(
                  file['path'],
                  filename: file['fileName'],
                ),
              )
              .toList()
        }..addAll(Map<String, dynamic>.from(body)));
      }
    } /* else {
      formData = FormData.fromMap(Map<String, dynamic>.from(body));
    }*/

    Future<Response>? futureResponse;

    Response response = Response(
      data: '',
      statusCode: 500,
      requestOptions: RequestOptions(
        path: url,
      ),
    );

    final Options options = Options(headers: headers);

    try {
      if (method == 'post') {
        futureResponse = client.post(url, data: formData ?? body, options: options);
      } else if (method == 'get') {
        futureResponse = client.get(url, options: options, queryParameters: queryParameters);
      } else if (method == 'put') {
        futureResponse = client.put(url, data: formData ?? body, options: options);
      } else if (method == 'patch') {
        futureResponse = client.patch(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      } else if (method == 'delete') {
        futureResponse = client.delete(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } on DioError catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          throw HttpError.badRequest;
        } else if (error.response!.statusCode == 401) {
          throw HttpError.unauthorized;
        } else if (error.response!.statusCode == 403) {
          throw HttpError.forbidden;
        } else if (error.response!.statusCode == 404) {
          throw HttpError.notFound;
        } else {
          throw HttpError.serverError;
        }
      }
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data ?? {};
    } else if (response.statusCode == 204) {
      return {};
    }
  }
}
