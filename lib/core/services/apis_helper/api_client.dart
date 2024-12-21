import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static String? _token;
  static final _storage = const FlutterSecureStorage();
  static const String _baseUrl = 'http://localhost:3000';

  // Dio instance
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: _baseUrl,
      ),
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_token != null) {
            _token = await getToken();
            options.headers['x-auth-token'] = _token;
          }
          log('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log('Response: [${response.statusCode}] ${response.realUri}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // log('Error: [${error.response?.statusCode}] ${error.message}');
          return handler.next(error);
        },
      ),
    );

  /// Set or update the token
  static Future<void> setToken(String? token) async {
    _token = token;
    await _storage.write(key: 'x-auth-token', value: _token);
  }

  // Get the current token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'x-auth-token');
  }

  /// General HTTP Request Handler
  static Future<T?> request<T>({
    required String path,
    required String method,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async {
    headers ??= _dio.options.headers;
    _dio.options.headers['x-auth-token'] = await getToken();

    // log('Request: $method $path');
    // log('Query Parameters: $queryParameters');
    // log('Headers: $headers');

    try {
      final response = await _dio.request(
        path,
        options: Options(method: method, headers: headers),
        queryParameters: queryParameters,
        data: data,
      );

      // log('Response Data: ${response.data}');

      if (parser != null) {
        return parser(response.data);
      }
      return response.data as T?;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    } catch (e) {
      log('Unhandled Exception: $e');
      throw Exception(e);
    }
  }

  /// HTTP Methods
  static Future<T?> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async =>
      request(
        path: path,
        method: 'GET',
        queryParameters: queryParameters,
        headers: headers,
        parser: parser,
      );

  static Future<T?> post<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async =>
      request(
        path: path,
        method: 'POST',
        data: data,
        headers: headers,
        parser: parser,
      );

  static Future<T?> put<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async =>
      request(
        path: path,
        method: 'PUT',
        data: data,
        headers: headers,
        parser: parser,
      );

  static Future<T?> delete<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
    T Function(dynamic data)? parser,
  }) async =>
      request(
        path: path,
        method: 'DELETE',
        data: data,
        headers: headers,
        parser: parser,
      );

  /// Handle Errors Globally
  static void _handleError(DioException error) {
    log("Error type: ${error.type}");

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        log('Connection timeout: ${error.message}');
        throw Exception('Connection timeout');
      case DioExceptionType.receiveTimeout:
        log('Receive timeout: ${error.message}');
        throw Exception('Receive timeout');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;
        log('Bad response: $statusCode $responseData');
        throw Exception(responseData?['msg'] ?? 'An error occurred');
      case DioExceptionType.cancel:
        log('Request canceled: ${error.message}');
        throw Exception('Request canceled');
      default:
        log('Unknown error: ${error.message}');
        throw Exception('An unknown error occurred');
    }
  }
}
