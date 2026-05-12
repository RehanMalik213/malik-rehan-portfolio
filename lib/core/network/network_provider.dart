import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/interceptors/header_log_interceptor.dart';
import 'package:portfolio/core/network/network_api_service.dart';

import 'interceptors/network_log_interceptor.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.yourdomain.com/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.addAll([HeadersInterceptor(), NetworkLogInterceptor()]);

  return dio;
});

// Network Service Provider
final networkServiceProvider = Provider<NetworkApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return NetworkApiService(dio);
});

// class NetworkBinding extends Bindings {
//   @override
//   void dependencies() {
//     // Dio Instance
//     Get.lazyPut<Dio>(() {
//       final dio = Dio(
//         BaseOptions(
//           baseUrl: "https://api.yourdomain.com/",
//           connectTimeout: const Duration(seconds: 30),
//         ),
//       );

//       dio.interceptors.addAll([HeadersInterceptor(), NetworkLogInterceptor()]);

//       return dio;
//     }, fenix: true);

//     // NetworkApiService Instance
//     Get.lazyPut<NetworkApiService>(
//       () => NetworkApiService(Get.find<Dio>()),
//       fenix: true,
//     );
//   }
// }
