import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/network/api_error.dart';

abstract class AppBaseApiService {
  // GET
  Future<Either<APIError, T>> getRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  });

  // POST
  Future<Either<APIError, T>> postRequest<T>({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  });

  // PUT (Update)
  Future<Either<APIError, T>> putRequest<T>({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  });

  // DELETE
  Future<Either<APIError, T>> deleteRequest<T>({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  });
}
