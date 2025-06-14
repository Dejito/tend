import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../app_launch.dart';
import '../../core/constants/app_url.dart';
import '../../core/constants/network_error_message.dart';
import '../../presentation/provider/auth_provider.dart';
import '../../presentation/views/widgets/flutter_toast.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late final Dio _dio;

  late BuildContext context;

  HttpUtil._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: AppUrl.baseUrl,
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'Accept': '*/*',
        // 'Accept-Charset': 'UTF-8',
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,

    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // final authProvider = Provider.of<AuthProvider>(context);

        // final token = getIt<AuthToken>().authToken;
        // if (token != null && token.isNotEmpty) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }
        return handler.next(options);
      },
      onResponse: (response, handler) => handler.next(response),
      onError: (error, handler) {
        // final message = _getErrorMessage(error);
        // showToast(message: message);
        handler.next(error);
      },
    ));

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (log) => debugPrint(log.toString()),
      ));
    }
  }

  static const Duration _defaultTimeout = Duration(minutes: 5);

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
      }) async {
    return _performRequest(() => _dio.get(
      url,
      queryParameters: queryParameters,
    ));
  }

  Future<Response> post(
      String url, {
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return _performRequest(() => _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  Future<Response> put(
      String url, {
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return _performRequest(() => _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  Future<Response> delete(
      String url, {
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return _performRequest(() => _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  Future<Response> patch(
      String url, {
        Object? data,
        Map<String, dynamic>? queryParameters,
      }) async {
    return _performRequest(() => _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
    ));
  }

  Future<Response> _performRequest(Future<Response> Function() request) async {
    try {
      return await request().timeout(_defaultTimeout);
    } on DioException catch (error) {
      // showToast(message: _getErrorMessage(error));
      rethrow;
    } catch (e) {
      // showToast(message: errorDefaultMessage);
      rethrow;
    }
  }

  String _getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Network connection timed out.";
      case DioExceptionType.badResponse:
        return error.response?.data["message"] ??
            "Server error (${error.response?.statusCode}). Please try again later.";
      case DioExceptionType.cancel:
        return "Request cancelled.";
      case DioExceptionType.connectionError:
        return "Network not available.";
      default:
        return "Something went wrong!";
    }
  }
}

extension ResponseExt on Response {
  bool get isSuccessful => statusCode != null && statusCode! >= 200 && statusCode! < 300;
  dynamic get body => data;
}

const String errorDefaultMessage = 'An error occurred';

String networkErrorHandler(DioException error, {Function(DioException e)? onResponseError}) {
  switch (error.type) {
    case DioExceptionType.badCertificate:
      return NetworkErrorMessage.errorOccurred;
    case DioExceptionType.connectionTimeout:
      return NetworkErrorMessage.noInternetConnection;
    case DioExceptionType.badResponse:
      return error.response?.data["message"] ?? errorDefaultMessage;
    case DioExceptionType.unknown:
      return error.response?.data["message"] ?? errorDefaultMessage;
    default:
      return errorDefaultMessage;
  }
}

void handleError({required dynamic error}) {
  String errorMessage;

  if (error is DioException) {
    final serverError = error.response?.data["message"];
    errorMessage = (serverError != null && serverError.toString().isNotEmpty)
        ? serverError.toString()
        : "Network error. Please try again";
  } else if (error is FormatException) {
    errorMessage = "Invalid data format received from server.";
  } else if (error is TimeoutException) {
    errorMessage = "Request timed out. Please check your internet connection.";
  } else {
    errorMessage = "Something went wrong. Please try again.";
  }

  // onEmit(errorMessage);
  showToast(message: errorMessage);
}
