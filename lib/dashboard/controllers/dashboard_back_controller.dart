import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:get/get.dart';
import 'package:scraping_job_front/dashboard/services/dashboard_service.dart';

/// Dashboard Controller - Manages dashboard state and logic
class DashboardBackController extends GetxController {
  final DashboardService _dashboardService = DashboardService();

  var isLoading = false.obs;
  // var dashboard = Rxn<Dashboard>();
  // var dashboardStats = Rxn<Map<String, dynamic>>();
  // var errorMessage = ''.obs;
  var dashboard = Rxn();

  @override
  void onInit() {
    super.onInit();
    fetchDashboard('');
  }

  /// Fetch dashboard data
  Future<void> fetchDashboard(String? query) async {
    try {
      isLoading.value = true;
      // errorMessage.value = '';

      final response = await _dashboardService.getDashboard(query);

      if (response.success && response.data != null) {
        dashboard.value = response.data;
      } else {
        // errorMessage.value = response.message ?? 'Failed to fetch dashboard';
      }
    } catch (e) {
      // errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch dashboard statistics
  // Future<void> fetchDashboardStats() async {
  //   try {
  //     isLoading.value = true;
  //     errorMessage.value = '';

  //     final response = await _dashboardService.getDashboardStats();

  //     if (response.success && response.data != null) {
  //       dashboardStats.value = response.data;
  //     } else {
  //       errorMessage.value = response.message ?? 'Failed to fetch statistics';
  //     }
  //   } catch (e) {
  //     errorMessage.value = 'Error: $e';
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Refresh dashboard data
  Future<void> refreshDashboard() async {
    await fetchDashboard('');
    // await fetchDashboardStats();
  }
}
