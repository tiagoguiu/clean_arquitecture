import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    if (kDebugMode == true) {
      String method = "";
      method = data?.method != null ? methodToString(data!.method) : "";
      debugPrint('\n---------------------------------- Request Data ----------------------------------');
      debugPrint('$method -> ${data?.url}');
      debugPrint('Headers: ${data?.headers}');
      debugPrint('Params: ${data?.params}');
      debugPrint('Body: ${data?.body}');
      debugPrint('-----------------------------------------------------------------------------------');
    }
    return data!;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    if (kDebugMode == true) {
      debugPrint('\n---------------------------------- Response Data ----------------------------------');
      debugPrint('Status: ${data?.statusCode}');
      debugPrint('Body: ${data?.body}');
      debugPrint('-----------------------------------------------------------------------------------');
    }
    return data!;
  }
}
