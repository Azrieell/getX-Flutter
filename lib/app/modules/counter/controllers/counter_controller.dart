import 'package:get/get.dart';

class CounterController extends GetxController {

  final count = 1.obs;

  void increment() {
  
    if (count.value < 30) {
    count.value++;
    } else {
      Get.snackbar(
        "Peringatan!", 
        "Tidak bisa lebih dari satu.",
        );
    }
  }
  void decrement() {
    if (count.value < 1) {
      count.value--;
    } else {
      Get.snackbar("Peringatan!", 
      "Tidak bisa kurang dari satu.",
      );
    }
  }
}
