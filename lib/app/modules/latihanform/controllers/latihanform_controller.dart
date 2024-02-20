import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../views/latihanformoutput_view.dart';

class LatihanController extends GetxController {
  var namaLengkap = ''.obs;
  var tempatLahir = ''.obs;
  var tanggalLahir = ''.obs;
  var jenisKelamin = ''.obs;
  var email = ''.obs;
  var negara = ''.obs;
  var cardnumber = ''.obs;
  final List<String> memberList = ['Reguler', 'Gold', 'Platinum', 'Vip'];
  var member = <String>[].obs;
  var isFormSubmitted = false.obs;
  var selectedDate = ''.obs;
  var totalpembayaran = 0.0.obs;
  var selectedMember = ''.obs;
  var deskripsi = ''.obs;
  var umur = ''.obs;
  var expired = ''.obs;

  List<String> getTipeMemberList() => memberList;

  Future<void> selectdate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    initialDate: DateTime.now(),
    lastDate: DateTime.now(),
  );

     if (picked != null) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
    tanggalLahir.value = formattedDate;
    DateTime now = DateTime.now();
    DateTime selectedDate = picked;
    int age = now.year - selectedDate.year;

    if (now.month < selectedDate.month ||
        (now.month == selectedDate.month && now.day < selectedDate.day)) {
      age--;
    }
    umur.value = '${age}'; // Perubahan nilai menjadi angka umur
  }
}
  

void toggleMemberList(String memberValue) {
  if (member.contains(memberValue)) {
    member.clear();
  } else {
    member.clear();
    member.add(memberValue);
  }
  selectedMember.value = memberValue;
  totalpembayaran.value = TotalPembayaran();
}


  TotalPembayaran() {
    if (selectedMember.value == 'Reguler') {
      deskripsi.value = 'Anggota 1 bulan'; 
      return 50000;
    } else if (selectedMember.value == 'Gold') {
      deskripsi.value = 'Anggota 1 bulan + cemilan gratis'; 
      return 150000;
    } else if (selectedMember.value == 'Platinum') {
      deskripsi.value = 'Anggota 2 bulan + cemilan gratis + free wifi'; 
      return 250000;
    } else if (selectedMember.value == 'Vip') {
      deskripsi.value = 'Anggota 3 bulan + cemilan gratis + free wifi + tiket konser'; 
      return 500000;
    } else {
      return 0;
    }
  }

  Future<void> selectexpired(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      expired.value = formattedDate;
    }
  }

  void submitForm() {
    print(
        // ignore: invalid_use_of_protected_member
        'Data Formulir: ${namaLengkap.value}, ${tempatLahir.value},${selectedDate.value}, ${jenisKelamin.value}, ${email.value}, ${member.value}, Total Pembayaran: ${totalpembayaran.value}');
    isFormSubmitted.value = true;
    Get.to(latihanformoutput());
  }
}
