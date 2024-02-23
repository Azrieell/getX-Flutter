import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => controller.logout(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          // Check if user data is available and valid
          if (controller.user.isNotEmpty && controller.user['username'] != null) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama: ${controller.user['username']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${controller.user['email']}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            // Handle case when user data is not available or not valid
            return Center(
              child: Text(
                'Data pengguna tidak tersedia',
                style: TextStyle(fontSize: 16),
              ),
            );
          }
        }
      }),
    );
  }
}
