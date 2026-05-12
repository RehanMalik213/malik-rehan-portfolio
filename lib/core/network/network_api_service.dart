import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:portfolio/core/network/api_error.dart';

import 'app_base_api_service.dart';

class NetworkApiService implements AppBaseApiService {
  final Dio _dio;

  NetworkApiService(this._dio);

  Future<Either<APIError, T>> _handleRequest<T>(
    Future<Response> request,
    T Function(dynamic data) fromJson,
  ) async {
    try {
      final response = await request;
      return Right(fromJson(response.data));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data is Map
          ? (e.response?.data['message'] ?? e.message)
          : (e.message ?? "Something went wrong");

      return Left(APIError(errorMessage, statusCode: e.response?.statusCode));
    } catch (e) {
      return Left(APIError(e.toString()));
    }
  }

  @override
  Future<Either<APIError, T>> getRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    return _handleRequest(
      _dio.get(path, queryParameters: queryParameters),
      fromJson,
    );
  }

  @override
  Future<Either<APIError, T>> postRequest<T>({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    return _handleRequest(
      _dio.post(path, data: body, queryParameters: queryParameters),
      fromJson,
    );
  }

  @override
  Future<Either<APIError, T>> putRequest<T>({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    return _handleRequest(
      _dio.put(path, data: body, queryParameters: queryParameters),
      fromJson,
    );
  }

  @override
  Future<Either<APIError, T>> deleteRequest<T>({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    return _handleRequest(
      _dio.delete(path, data: data, queryParameters: queryParameters),
      fromJson,
    );
  }
}
