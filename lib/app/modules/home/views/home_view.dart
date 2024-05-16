import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Restart The application to perform different action",
            style: TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () => Get.toNamed('/user-data'),
                  child: const Text("Save Data")),
              ElevatedButton(
                  onPressed: () => controller.getUsersOrderByAge(),
                  child: const Text("Display All data")),
              ElevatedButton(
                  onPressed: () => controller.ismailData(),
                  child: const Text("Ismail data")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: controller.userDataList.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(),
                title: Text(controller.userDataList[index].name),
                subtitle: Text(controller.userDataList[index].email),
              ),
            ),
          )
        ],
      ),
    );
  }
}