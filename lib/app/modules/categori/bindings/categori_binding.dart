import 'package:get/get.dart';

import '../controllers/categori_controller.dart';

class CategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriController>(
      () => CategoriController(),
    );
  }
}
