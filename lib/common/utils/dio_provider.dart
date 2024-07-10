import 'package:dio/dio.dart';
import 'package:ariane_mobile/common/utils/dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ariane_mobile/auth/handler/app_state.dart' as app_state;

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors
      .add(LoggerInterceptor(userManager: app_state.currentManager));
  dio.options.baseUrl = "https://nomorvirtual.com/api/";
  dio.options.headers = {'User-Agent': "Android"};
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  return dio;
}
