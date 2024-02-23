import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pettycashpall/app/data/models/categori_model.dart';
import 'package:pettycashpall/app/modules/categori/controllers/categori_controller.dart';
import 'package:pettycashpall/app/modules/categori/views/show_categori_view.dart';

class CategoriView extends StatelessWidget {
  final CategoriController controller = Get.put(CategoriController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the add category page
              Get.toNamed('/categori/add');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.categoriList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.categoriList.length,
                itemBuilder: (context, index) {
                  var category = controller.categoriList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        category.incomeCategory ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        category.expenditureCategory ?? '',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.toNamed('/categori/edit', arguments: category);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_red_eye), // Icon Mata
                            onPressed: () {
                              Get.to(() => DetailCategoriView(categori: category));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, category);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Categori category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Category'),
          content: Text('Are you sure you want to delete this category?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deleteCategory method from the controller
                controller.deleteCategori(category);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
