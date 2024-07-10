import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class LoggerInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logError('❌ Dio Error!');
    logError('❌ Url: ${err.requestOptions.uri}');
    logError('❌ ${err.stackTrace}');
    logError('❌ Response Error: ${err.response?.data}');
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logInfo('-------------------------');
    logInfo('🌍 Sending network request: ${options.baseUrl}${options.path}');
    logInfo('-------------------------');
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    logDebug('-------------------------');
    logDebug('⬅️ Received network response');
    logDebug(
        '${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    logDebug('Query params: ${response.requestOptions.queryParameters}');
    logDebug('-------------------------');
    return handler.next(response);
  }
}
