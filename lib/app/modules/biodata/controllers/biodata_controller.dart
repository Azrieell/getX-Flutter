import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BiodataController extends GetxController {
  var nama = ''.obs;
  var agama = ''.obs;
  var jenisKelamin = ''.obs;
  var alamat = ''.obs;
  final List<String> hobiList = [
    'Menari',
    'Membaca',
    'Bernyanyi',
    'Berenang',
    'Sepak Bola'
  ];
  var hobi = <String>[].obs;
  var isFormSubmitted = false.obs;
  var selectedDate = ''.obs;

  List<String> getHobiList() => hobiList;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate.value = formattedDate; // simpan tanggal dipilih
    }
  }

  void toggleHobi(String hobiValue) {
    if (hobi.contains(hobiValue)) {
      hobi.remove(hobiValue);
    } else {
      hobi.add(hobiValue);
    }
  }

  void submitForm(BuildContext context) {
    print(
        'Data Formulir: ${nama.value}, ${selectedDate.value}, ${agama.value}, ${jenisKelamin.value}, ${alamat.value}, ${hobi.value}');
    isFormSubmitted.value = true;
    _showAlert(context);
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Biodata Anda'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nama: ${nama.value}'),
                Text('Tanggal Lahir: ${selectedDate.value}'),
                Text('Agama: ${agama.value}'),
                Text('Jenis Kelamin: ${jenisKelamin.value}'),
                Text('Alamat: ${alamat.value}'),
                Text('Hobi: ${hobi}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}