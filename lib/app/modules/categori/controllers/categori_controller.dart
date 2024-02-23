import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pettycashpall/app/data/models/categori_model.dart';
import 'package:pettycashpall/app/modules/categori/views/show_categori_view.dart';
import '../../../providers/api.dart';
// ignore: unused_import
import 'package:pettycashpall/app/routes/app_pages.dart';

class CategoriController extends GetxController {
  var categoriList = <Categori>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/categori';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        categoriList
            .assignAll(jsonResponse.map((model) => Categori.fromJson(model)));
      } else {
        throw Exception('Failed to load categori');
      }
    } catch (e) {
      print('Error during fetching categori: $e');
    }
  }

  Future<void> tambahCategori(
    String income_category,
    String expenditure_category,
  ) async {
    try {
      if (income_category.isEmpty || expenditure_category.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categori/add';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'income_category': income_category,
          'expenditure_category': expenditure_category
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Categori berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.CATEGORI);
      } else {
        throw Exception('Failed to add categori');
      }
    } catch (e) {
      print('Error during tambah categori: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  //Show Categori
  void showCategoriDetails(Categori categori) {
    Get.to(() => DetailCategoriView(categori: categori));
  }

  Future<void> editCategori(
    Categori categori,
    String income_category,
    String expenditure_category,
  ) async {
    try {
      if (income_category.isEmpty || expenditure_category.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categori/edit/${categori.id}';
      var headers = await Api.getHeaders();

      var response = await http.patch(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'income_category': income_category, 
          'expenditure_category':
              expenditure_category,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'categori berhasil diubah');
        fetchData(); // Refresh the pasienList
        Get.offAndToNamed(Routes.CATEGORI);
      } else {
        throw Exception('Failed to edit categori');
      }
    } catch (e) {
      print('Error during edit categori: $e');
    }
  }

  Future<void> deleteCategori(Categori categori) async {
    try {
      var apiUrl = '${Api.baseUrl}/categori/delete/${categori.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Category successfully deleted');
        fetchData();
      } else {
        throw Exception('Failed to delete categori');
      }
    } catch (e) {
      print('Error during delete categori: $e');
    }
  }
}
