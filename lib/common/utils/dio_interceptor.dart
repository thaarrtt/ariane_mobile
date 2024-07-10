import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:oidc/oidc.dart';

const kAuthorizationHeader = 'Authorization';
void _tryAppendAccessToken(
  OidcUserManager userManager,
  Map<String, dynamic> headers,
) {
  if (headers.containsKey(kAuthorizationHeader)) {
    // do nothing if header already exists.
    return;
  }
  final accessToken = userManager.currentUser?.token.accessToken;
  if (accessToken != null) {
    headers[kAuthorizationHeader] = 'Bearer $accessToken';
  }
}

class LoggerInterceptor implements Interceptor {
  LoggerInterceptor({required this.userManager});
  final OidcUserManager userManager;

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
    _tryAppendAccessToken(userManager, options.headers);
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
