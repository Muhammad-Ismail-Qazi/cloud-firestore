import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/user_data_controller.dart';

class UserDataView extends GetView<UserDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserDataView'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        height: 280,
        width: double.infinity,
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(controller.profileURL),
              radius: 50,
            ),
            Obx(() {
              print("set change in name ");
              return Text(controller.name.value);
            }),
            Obx(() {
              print("set change in email");
              return Text(controller.email.value);
            }),
            Obx(() => Text(controller.contact.value)),
            Obx(() => Text(controller.age.value)),
            OutlinedButton(
                onPressed: () => controller.addUser(),
                child: const Text("Save"))
          ],
        ),
      )),
    );
  }
}