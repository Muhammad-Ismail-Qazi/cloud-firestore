import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/app/constant/firebase_constant.dart';
import 'package:firebase_firestore/app/modules/user_data/model/user_data_model.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {
  DateTime dateTime = DateTime.now();
  String formatedDate = '';
  RxString name = "Al-Muflihoon".obs;
  RxString email = "muhammad.ismail15604@gmail.com".obs;
  RxString contact = '+923414142798'.obs;
  String DOB = "18-01-2007";
  RxString age = ''.obs;
  String profileURL =
      'https://i.pinimg.com/564x/54/72/d1/5472d1b09d3d724228109d381d617326.jpg';

  @override
  void onInit() {
    super.onInit();
    formatedDate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    calculateAge();
  }

  void calculateAge() {
    // Convert DOB to DateTime object
    List<String> dobParts = DOB.split('-');
    int dobDay = int.parse(dobParts[0]);
    int dobMonth = int.parse(dobParts[1]);
    int dobYear = int.parse(dobParts[2]);
    DateTime dobDateTime = DateTime(dobYear, dobMonth, dobDay);

    // Calculate age
    Duration difference = dateTime.difference(dobDateTime);
    int ageInYears = difference.inDays ~/ 365; // Approximate age in years
    age.value = ageInYears.toString();
  }

  Future<void> addUser() async {
    try {
      UserModel userModel = UserModel(
          name: name.value,
          email: email.value,
          contact: contact.value,
          age: age.value,
          profileURL: '');
      userCollection.add(userModel.toMap()).then((value) => {
            Get.snackbar('Success', "User Data is save successfully"),
            print("data is save"),
          });
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> setUser() async {
    try {
      UserModel userModel = UserModel(
          profileURL: 'dsfjn',
          age: age.value,
          contact: contact.value,
          email: email.value,
          name: name.value);

      await userCollection.doc().set(userModel.toMap()).then((value) {
        Get.snackbar('Success', "User Data is save successfully");
        print("data is save");
      });
    } catch (exception) {
      print(exception);
    }
  }

  Future<void> updateProfileURLAttribute(String docYouWantUpdateID) async {
    try {
      userCollection.doc(docYouWantUpdateID).update({
        'company': 'Al Muflihoon',
      }).then((value) {
        Get.snackbar('Success', "User Data is Updated successfully");
      });
    } catch (excption) {
      print(excption);
    }
  }

  Future<void> delete(String passIDHere) async {
    try {
      userCollection.doc(passIDHere).delete().then((value) =>
          Get.snackbar('Success', "User Data is deleted successfully"));
    } catch (exception) {
      print(exception);
    }
  }

  Future<void> deleteField(String passIDHere) async {
    try {
      userCollection.doc(passIDHere).update({
        'age': FieldValue.delete(),
      }).then((value) =>
          Get.snackbar('Success', "User field Data is deleted successfully"));
    } catch (exception) {
      print(exception);
    }
  }
}