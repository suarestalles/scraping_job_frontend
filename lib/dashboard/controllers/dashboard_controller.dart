import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/dashboard/services/dashboard_service.dart';
import 'package:scraping_job_front/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  void openJobDescription(Map<String, dynamic> job) {
    Get.defaultDialog(
      title: job['job_title'] ?? '',
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
      backgroundColor: tertiaryColor,
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enterprise: ${job['employer_name']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              Divider(color: Colors.white),
              Text(job['job_description'] ?? '', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Close'),
        ),
        ElevatedButton(
          onPressed: () => openUrl(job['job_apply_link']),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(secondaryColor),
          ),
          child: Text('Apply Now'),
        ),
      ],
    );
  }

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // 👈 opens browser tab
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<Map<String, dynamic>?> fetchJobs() async {
    dynamic data;
    try {
      await DashboardService().getDashboard(searchController.text).then((response) {
        if (response.success && response.data != null) {
          data = response.data;
        }
      });
    } catch (e) {
      log('Error fetching jobs: $e');
      data = null;
    }
    return data;
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    super.update(ids, condition);
  }
}