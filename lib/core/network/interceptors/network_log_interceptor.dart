import 'package:dio/dio.dart';
import 'package:portfolio/core/utils/logs_helper/app_logs.dart';

class NetworkLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    "API Request: [${options.method}] ${options.uri}".logs();
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    "API Error: ${err.message}".logs();
    handler.next(err);
  }
}
