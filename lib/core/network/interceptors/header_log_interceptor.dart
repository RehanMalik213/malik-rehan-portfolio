import 'package:dio/dio.dart';
import 'package:portfolio/core/local_storage/app_preferences.dart';

class HeadersInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // logout logic handle here
      AppPreferences.instance.clearBearerToken();
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final prefs = AppPreferences.instance;

    if (prefs.hasBearerToken()) {
      options.headers['Authorization'] = 'Bearer ${prefs.getBearerToken()}';
    }
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // Continue with the default handling
  }
}
