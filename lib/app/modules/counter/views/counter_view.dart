import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Text(
                '${controller.count}',
              style: TextStyle(fontSize: controller.count.toDouble()),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {controller.increment();
                  },
                  child: Icon(Icons.add),
                  ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {controller.decrement();
                  },
                  child: Icon(Icons.remove),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
