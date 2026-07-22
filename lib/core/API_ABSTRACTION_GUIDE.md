/// API Abstraction Setup Guide
///
/// This document explains the API abstraction structure created for your project.
///
/// ## Structure Overview
///
/// ### 1. Configuration (lib/core/config/)
/// - `api_config.dart`: Centralized API configuration with environment management
///   - Supports multiple environments: localhost, development, staging, production
///   - Easy to switch between environments
///   - Usage: `ApiConfig.baseUrl`, `ApiConfig.getFullUrl(endpoint)`
///
/// ### 2. Models (lib/core/models/)
/// - `api_response.dart`: Generic API response wrapper
///   - Provides consistent response format across all API calls
///   - Contains success/error factory methods
///   - Easy to handle responses uniformly
///
/// ### 3. Base Service (lib/core/services/)
/// - `base_api_service.dart`: Abstract base class for all API services
///   - Implements common HTTP methods: GET, POST, PUT, DELETE
///   - Handles error cases and socket exceptions
///   - Automatic header management
///   - Uses GetConnect (from GetX package)
///
/// ### 4. Constants (lib/core/constants/)
/// - `api_endpoints.dart`: All API endpoints defined in one place
///   - Easy to maintain and update
///   - Prevents hardcoding endpoints throughout the app
///
/// ### 5. Feature Services (lib/features/[feature]/services/)
/// - Example: `dashboard_service.dart`
/// - Extends BaseApiService
/// - Implements feature-specific API methods
/// - Each feature has its own service class
///
/// ### 6. Controllers (lib/features/[feature]/controllers/)
/// - Example: `dashboard_controller.dart`
/// - Uses GetX for state management
/// - Calls service methods
/// - Manages loading states and error messages
///
/// ## How to Use
///
/// ### Setup in main.dart
/// ```dart
/// import 'package:scraping_job_front/core/config/api_config.dart';
///
/// void main() {
///   // Set the API environment (default is localhost)
///   ApiConfig.environment = ApiEnvironment.localhost;
///
///   runApp(const MyApp());
/// }
/// ```
///
/// ### Create a New Feature Service
/// ```dart
/// import '../../../core/services/base_api_service.dart';
/// import '../../../core/constants/api_endpoints.dart';
/// import '../models/your_model.dart';
///
/// class YourService extends BaseApiService {
///   Future<ApiResponse<YourModel>> getYourData() async {
///     return get<YourModel>(
///       endpoint: ApiEndpoints.yourEndpoint,
///       fromJson: (json) => YourModel.fromJson(json),
///     );
///   }
/// }
/// ```
///
/// ### Use in Controller
/// ```dart
/// class YourController extends GetxController {
///   final YourService _service = YourService();
///   var data = Rxn<YourModel>();
///   var isLoading = false.obs;
///
///   Future<void> fetchData() async {
///     isLoading.value = true;
///     final response = await _service.getYourData();
///     if (response.success && response.data != null) {
///       data.value = response.data;
///     }
///     isLoading.value = false;
///   }
/// }
/// ```
///
/// ### Use in UI
/// ```dart
/// class YourWidget extends StatelessWidget {
///   final controller = Get.put(YourController());
///
///   @override
///   Widget build(BuildContext context) {
///     return Obx(() {
///       if (controller.isLoading.value) {
///         return const CircularProgressIndicator();
///       }
///       return Text(controller.data.value?.name ?? 'No data');
///     });
///   }
/// }
/// ```
///
/// ## Benefits
///
/// ✓ Centralized API configuration
/// ✓ Easy to switch between environments
/// ✓ Consistent error handling
/// ✓ Reusable for all features
/// ✓ Clean separation of concerns
/// ✓ Easy to add new features
/// ✓ Easy to add authentication headers
/// ✓ Easy to test and mock
///
/// ## Next Steps
///
/// 1. Add more endpoints to `api_endpoints.dart`
/// 2. Create service classes for each feature extending BaseApiService
/// 3. Create controllers for each feature using GetX
/// 4. Implement UI widgets that consume the controllers
/// 5. Later, add authentication by modifying the base service headers
///
