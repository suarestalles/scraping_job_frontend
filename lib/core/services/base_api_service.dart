import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import '../config/api_config.dart';
import '../models/api_response.dart';

/// Base API Service - Abstract class for all API services
abstract class BaseApiService {
  final GetConnect _getConnect = GetConnect(
    timeout: ApiConfig.connectionTimeout,
  );

  /// Generic GET request
  Future<ApiResponse<T>> get<T>({
    required String endpoint,
    required T Function(dynamic json) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final url = ApiConfig.getFullUrl(endpoint);
      final response = await _getConnect.get(
        url,
        headers: _mergeHeaders(headers),
      );

      return _handleResponse<T>(
        response: response,
        fromJson: fromJson,
      );
    } on SocketException {
      return ApiResponse.error(
        message: 'Network error: Check your connection',
        statusCode: 0,
      );
    } catch (e) {
      return ApiResponse.error(
        message: 'Error: $e',
        error: e,
      );
    }
  }

  /// Generic POST request
  Future<ApiResponse<T>> post<T>({
    required String endpoint,
    required dynamic body,
    required T Function(dynamic json) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final url = ApiConfig.getFullUrl(endpoint);
      final response = await _getConnect.post(
        url,
        body,
        headers: _mergeHeaders(headers),
      );

      return _handleResponse<T>(
        response: response,
        fromJson: fromJson,
      );
    } on SocketException {
      return ApiResponse.error(
        message: 'Network error: Check your connection',
        statusCode: 0,
      );
    } catch (e) {
      return ApiResponse.error(
        message: 'Error: $e',
        error: e,
      );
    }
  }

  /// Generic PUT request
  Future<ApiResponse<T>> put<T>({
    required String endpoint,
    required dynamic body,
    required T Function(dynamic json) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final url = ApiConfig.getFullUrl(endpoint);
      final response = await _getConnect.put(
        url,
        body,
        headers: _mergeHeaders(headers),
      );

      return _handleResponse<T>(
        response: response,
        fromJson: fromJson,
      );
    } on SocketException {
      return ApiResponse.error(
        message: 'Network error: Check your connection',
        statusCode: 0,
      );
    } catch (e) {
      return ApiResponse.error(
        message: 'Error: $e',
        error: e,
      );
    }
  }

  /// Generic DELETE request
  Future<ApiResponse<T>> delete<T>({
    required String endpoint,
    required T Function(dynamic json) fromJson,
    Map<String, String>? headers,
  }) async {
    try {
      final url = ApiConfig.getFullUrl(endpoint);
      final response = await _getConnect.delete(
        url,
        headers: _mergeHeaders(headers),
      );

      return _handleResponse<T>(
        response: response,
        fromJson: fromJson,
      );
    } on SocketException {
      return ApiResponse.error(
        message: 'Network error: Check your connection',
        statusCode: 0,
      );
    } catch (e) {
      return ApiResponse.error(
        message: 'Error: $e',
        error: e,
      );
    }
  }

  /// Handle response parsing
  ApiResponse<T> _handleResponse<T>({
    required Response response,
    required T Function(dynamic json) fromJson,
  }) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = fromJson(response.body);
        return ApiResponse.success(
          data: data,
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse.error(
          message: response.statusText ?? 'Error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(
        message: 'Failed to parse response: $e',
        error: e,
      );
    }
  }

  /// Merge default headers with custom headers
  Map<String, String> _mergeHeaders(Map<String, String>? customHeaders) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }
}
