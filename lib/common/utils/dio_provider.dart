import 'package:dio/dio.dart';
import 'package:ariane_mobile/common/utils/dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(LoggerInterceptor());
  dio.options.baseUrl = "https://nomorvirtual.com/api/";
  dio.options.headers = {'User-Agent': "Android"};
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  return dio;
}
