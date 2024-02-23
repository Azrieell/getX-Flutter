  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:pettycashpall/app/data/models/categori_model.dart';
  import 'package:pettycashpall/app/modules/categori/controllers/categori_controller.dart';

  class EditCategoriView extends StatelessWidget {
    final Categori categori;
    final CategoriController controller = Get.find();
    final TextEditingController incomeCategoryController = TextEditingController();
    final TextEditingController expenditureCategoryController = TextEditingController();

    EditCategoriView({required this.categori}) {
      incomeCategoryController.text = categori.incomeCategory ?? '';
      expenditureCategoryController.text = categori.expenditureCategory ?? '';
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Categori'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: incomeCategoryController,
                decoration: InputDecoration(labelText: 'Kategori Pemasukan'),
              ),
              TextFormField(
                controller: expenditureCategoryController,
                decoration: InputDecoration(labelText: 'Kategori Pengeluaran'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_validateInput()) {
                    controller.editCategori(
                      categori,
                      incomeCategoryController.text,
                      expenditureCategoryController.text,
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
      if (incomeCategoryController.text.isEmpty || expenditureCategoryController.text.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return false;
      }
      return true;
    }
  }
