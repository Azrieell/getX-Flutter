import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var email = ''.obs;
  var password = ''.obs;

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

Future<void> login() async {
  try {
    var response = await _performLogin();
    var responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      if (responseBody['accessToken'] != null) {
        // login sukses
        _saveUserData(responseBody);
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Login failed. Invalid response from server.');
      }
    } else {
      Get.snackbar('Error', 'Login failed. ${responseBody['message']}');
    }
  } catch (e) {
    print('Error during login: $e');
    Get.snackbar('Error', 'An error occurred during login.');
  }
}

  Future<http.Response> _performLogin() async {
    var apiUrl = '/auth/login';
    var requestBody = {'email' : email.value, 'password' : password.value};

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    localstorage.setString('token', responseBody['accessToken']);
    // localstorage.setString('user', jsonEncode(responseBody['user']));
    }

    void goToRegister() {
      Get.toNamed('/register');
    }
  }  
