import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.copyWith(
      headers: {
        "Content-Type": "application/json",
        // 'Authorization': 'Bearer $accessToken',
      },
    );
    return super.onRequest(options, handler);
  }
}
