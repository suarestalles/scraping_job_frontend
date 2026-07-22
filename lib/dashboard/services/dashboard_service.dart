// import 'package:get/get.dart';

import 'package:scraping_job_front/core/constants/api_endpoints.dart';
import 'package:scraping_job_front/core/models/api_response.dart';
import 'package:scraping_job_front/core/services/base_api_service.dart';

/// Dashboard Service - Handles all dashboard API calls
class DashboardService extends BaseApiService {
  /// Get dashboard data
  Future<ApiResponse<Map<String, dynamic>>> getDashboard(String? query) async {
    return get<Map<String, dynamic>>(
      endpoint: '${ApiEndpoints.searchJobs}?query=${Uri.encodeQueryComponent(query ?? "")}',
      fromJson: (response) {
        // If your API returns data wrapped in a 'data' field
        return response;
      },
    );
  }

  // /// Get dashboard statistics
  // Future<ApiResponse<Map<String, dynamic>>> getDashboardStats() async {
  //   return get<Map<String, dynamic>>(
  //     endpoint: ApiEndpoints.getDashboardStats,
  //     fromJson: (json) {
  //       return json is Map<String, dynamic> ? json : {};
  //     },
  //   );
  // }

  // /// Get dashboard charts data
  // Future<ApiResponse<Map<String, dynamic>>> getDashboardCharts() async {
  //   return get<Map<String, dynamic>>(
  //     endpoint: ApiEndpoints.getDashboardCharts,
  //     fromJson: (json) {
  //       return json is Map<String, dynamic> ? json : {};
  //     },
  //   );
  // }
}
