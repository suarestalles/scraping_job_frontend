import 'dart:developer';

/// Configuration for API endpoints and environment settings
enum ApiEnvironment { development, production }

class ApiConfig {
  static ApiEnvironment _environment = ApiEnvironment.development;

  static ApiEnvironment get environment => _environment;

  static set environment(ApiEnvironment env) {
    _environment = env;
  }

  static String get baseUrl {
    switch (_environment) {
      // case ApiEnvironment.localhost:
        // return 'https://dev-api.example.com';
      case ApiEnvironment.development:
        return 'http://192.168.1.6:8000';
      // case ApiEnvironment.staging:
      //   return 'https://staging-api.example.com';
      case ApiEnvironment.production:
        return 'https://api.example.com';
    }
  }

  // static String get apiVersion => '/api/v1';

  static String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }

  static Duration get connectionTimeout => const Duration(seconds: 30);
  static Duration get receiveTimeout => const Duration(seconds: 30);
}
