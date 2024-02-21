import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WWWWWWW',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: Text("Pindah Ke Halaman Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              },
              child: Text("Pindah Ke Halaman Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/biodata');
              },
              child: Text("Pindah Ke Halaman Biodata"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/latihanform');
              },
              child: Text("Pindah Ke Halaman Latihan"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: Text("SignUp"),
            ),
          ],
        ),
      ),
    );
  }
}
