// bottom_menu_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettycashpall/app/modules/categori/views/categori_view.dart';
import 'package:pettycashpall/app/modules/home/views/home_view.dart';
import 'package:pettycashpall/app/modules/profile/views/profile_view.dart';
import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends StatelessWidget {
  final BottomMenuController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [HomeView(), CategoriView(), ProfileView()],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categori',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}