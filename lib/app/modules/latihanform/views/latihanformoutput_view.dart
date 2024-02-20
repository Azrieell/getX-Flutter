import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihanform_controller.dart';

class latihanformoutput extends StatelessWidget {
  final LatihanController controller = Get.put(LatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nama Lengkap: ${controller.namaLengkap.value}'),
                Text('Tempat Lahir: ${controller.tempatLahir.value}'),
                Text('Tanggal Lahir: ${controller.umur.value} tahun'),
                Text('Jenis Kelamin: ${controller.jenisKelamin.value}'),
                Text('Email: ${controller.email.value}'),
                Text('Negara: ${controller.negara.value}'),
                // ignore: invalid_use_of_protected_member
                Text('Jenis Member: ${controller.member.value}'),
                Text('Nomor Kartu: ${controller.cardnumber.value}'),
                Text('Expired: ${controller.expired.value}'),
                // Text('Tanggal Expired: ${controller.selectedDate.value}'),
                Text('Harga Member: ${controller.totalpembayaran.value}'),
                Text('Benefit : ${controller.deskripsi.value}'),
          ],
        ),
      )
    );
  }
}