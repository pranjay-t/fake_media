import 'package:fake_media/api/api_services.dart';
import 'package:fake_media/common/app_url.dart';
import 'package:fake_media/models/app_data.dart';
import 'package:fake_media/models/user_model.dart';
import 'package:fake_media/response/status.dart';
import 'package:get/get.dart';

// Controller for managing user-related operations, including fetching user data.
class UserController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final AppData _appData = AppData(); 
  final AppUrl _appUrl = AppUrl();

  // Observable status for tracking request states.
  var requestStatus = Status.loading.obs;
  
  // Stores error messages for user-related requests.
  var userErrors = <String, String>{}.obs;

  // Updates the request status.
  void setRequestStatus(Status status) => requestStatus.value = status;

  /* Fetches user data by user ID if not already cached. 
   - [userId]: The ID of the user to fetch.
   - Caches the user data in [_appData] if successful.
   - Stores an error message in [userErrors] if the request fails.
  */
  Future<void> fetchUserById(String userId) async {
    try {
      // Return if user data is already present.
      if (_appData.users.containsKey(userId)) return;

      final response = await _apiServices.getApi(_appUrl.user(userId));

      if (response != null && response is Map<String, dynamic>) {
        _appData.setUser(UserModel.fromJson(response), userId);
        requestStatus.value = Status.success;
      } else {
        userErrors[userId] = "User not found.";
        requestStatus.value = Status.error;
      }
    } catch (e) {
      userErrors[userId] = e.toString();
      requestStatus.value = Status.error;
    }
  }

  // Returns a map of cached users.
  Map<String, UserModel> get users => _appData.users;

  // Getter for retrieving the selected user ID.
  Rxn<String> get userId => _appData.selectedUserId;
}
