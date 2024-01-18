import 'dart:async';
import 'package:bfsi/core/utils/app_config.dart';
import 'package:bfsi/domain/repositories/auth/auth_repository.dart';
import 'package:bfsi/infrastructure/network/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BfsiApiClient {
  /// dio instance
  final Dio _dio;

  /// Defines the base URL that will be used for each network request.
  final String? _baseUrl;

  Dio getDioClient() => _dio;

  // injecting dio instance
  BfsiApiClient(this._dio, this._baseUrl) {
    _dio
      ..options.baseUrl = _baseUrl ?? ''
      ..options.connectTimeout =
          const Duration(milliseconds: ApiEndPoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: ApiEndPoints.receiveTimeout)
      ..options.headers = <String, dynamic>{}
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(
        [
          InterceptorsWrapper(
            onRequest: (
              RequestOptions options,
              RequestInterceptorHandler handler,
            ) async {
              final authRepository = GetIt.I<AuthRepository>();
              final appConfig = GetIt.I<AppConfig>();
              final token = await authRepository.getToken();
              if (options.path !=
                  '${appConfig.baseUrl}${ApiEndPoints.loginApiPost}') {
                debugPrint('Path - ${options.path}');
                options.headers['authorization'] = 'Bearer $token';
                options.headers['client_access'] = appConfig.clientAccess;
              }
              return handler.next(options);
            },
            onError: (
              DioException err,
              ErrorInterceptorHandler handler,
            ) async {
              return handler.next(err);
            },
          ),
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      );
  }

  // Get:-----------------------------------------------------------------------
  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.get<Map<String, dynamic>>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) {
        // Handle 404 response as needed
        return error.response; // or throw a custom exception
      }
      return error.response;
    }
    return response;
  }

  // Post:----------------------------------------------------------------------
  Future<Response?> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isShowError = true,
  }) async {
    Response response;
    try {
      response = await _dio.post<dynamic>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      return error.response;
    }
    return response;
  }

  // Patch:----------------------------------------------------------------------
  Future<Response?> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      return error.response;
    }
    return response;
  }

  // Put:-----------------------------------------------------------------------
  Future<Response?> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (error) {
      return error.response;
    }
    return response;
  }

  // Delete:--------------------------------------------------------------------
  Future<Response?> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response;
    try {
      response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (error) {
      return error.response;
    }
    return response;
  }
}
