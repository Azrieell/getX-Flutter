import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/api.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      // Get the token from SharedPreferences
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      // Check if token exists before making the request
      if (token == null) {
        throw Exception('Token not found');
      }

      // Set the Authorization header with the token
      var headers = {'Authorization': 'Bearer $token'};

      // Perform user details API request
      var apiUrl = '/auth/me';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Decode the response JSON
        var apiResponse = json.decode(response.body);

        // Check if the response contains the required fields
        if (apiResponse != null &&
            // apiResponse['uuid'] != null &&
            apiResponse['username'] != null &&
            apiResponse['email'] != null ) {
          // Update the user value
          user.value = apiResponse;
        } else {
          throw Exception('Invalid user data received');
        }
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      // Clear token or user data from Local storage
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');

      // Navigate to login page
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
