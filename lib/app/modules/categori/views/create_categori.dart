import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettycashpall/app/modules/categori/controllers/categori_controller.dart';

class TambahCategoriView extends StatelessWidget {
  final CategoriController controller = Get.find<CategoriController>();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController expenditureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: incomeController,
              decoration: InputDecoration(
                labelText: 'Income Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: expenditureController,
              decoration: InputDecoration(
                labelText: 'Expenditure Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.tambahCategori(
                    incomeController.text,
                    expenditureController.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (incomeController.text.isEmpty || expenditureController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
