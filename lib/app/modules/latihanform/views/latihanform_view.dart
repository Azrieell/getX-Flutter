import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihanform_controller.dart';

class LatihanformView extends StatelessWidget {
  LatihanformView({Key? key}) : super(key: key);

  final LatihanController latihanController = Get.put(LatihanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Form'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(), // Border style
                        ),
                        style: TextStyle(fontSize: 16.0), // Font size
                        onChanged: (value) =>
                            latihanController.namaLengkap.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Tempat Lahir',
                          border: OutlineInputBorder(), // Border style
                        ),
                        style: TextStyle(fontSize: 16.0), // Font size
                        onChanged: (value) =>
                            latihanController.tempatLahir.value = value,
                      ),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: () => latihanController.selectdate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Tanggal Lahir',
                            border: OutlineInputBorder(), // Border style
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() =>
                                  Text(latihanController.selectedDate.value)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text('Jenis Kelamin', style: TextStyle(fontSize: 16.0)),
                      Row(
                        children: [
                          Obx(() => Radio(
                                value: 'Laki-laki',
                                groupValue: latihanController.jenisKelamin.value,
                                onChanged: (value) =>
                                    latihanController.jenisKelamin.value = value!,
                              )),
                          Text('Laki-laki'),
                          Obx(() => Radio(
                                value: 'Perempuan',
                                groupValue: latihanController.jenisKelamin.value,
                                onChanged: (value) =>
                                    latihanController.jenisKelamin.value = value!,
                              )),
                          Text('Perempuan'),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(), // Border style
                        ),
                        style: TextStyle(fontSize: 16.0), // Font size
                        onChanged: (value) =>
                            latihanController.email.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Negara',
                          border: OutlineInputBorder(), // Border style
                        ),
                        style: TextStyle(fontSize: 16.0), // Font size
                        onChanged: (value) =>
                            latihanController.negara.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nomor Kartu',
                          border: OutlineInputBorder(), // Border style
                        ),
                        style: TextStyle(fontSize: 16.0), // Font size
                        onChanged: (value) =>
                            latihanController.cardnumber.value = value,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () => latihanController.selectexpired(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Expired Date",
                              hintText: "Expired Date",
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Expired Date :"),
                                Obx(() =>
                                    Text(latihanController.expired.value))
                              ],
                            ),
                          )),
                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Tipe Member :', style: TextStyle(fontSize: 16.0)),
                          for (String member
                              in latihanController.getTipeMemberList())
                            Obx(() => CheckboxListTile(
                                  title: Text(member, style: TextStyle(fontSize: 16.0)),
                                  value:
                                      latihanController.member.contains(member),
                                  onChanged: (value) =>
                                      latihanController.toggleMemberList(member),
                                )),
                          SizedBox(height: 16.0),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Obx(() => Text(
                        'Pembayaran : ${latihanController.totalpembayaran.value}',
                        style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => latihanController.submitForm(),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (latihanController.isFormSubmitted.value) {
                    return Text(
                      'Output: ${latihanController.namaLengkap.value}, ${latihanController.tempatLahir}, ${latihanController.selectedDate.value}, ${latihanController.jenisKelamin.value}, ${latihanController.email.value}, ${latihanController.negara.value}, ${latihanController.member}',
                      style: TextStyle(fontSize: 16.0),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
