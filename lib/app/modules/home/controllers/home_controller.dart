import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestore/app/constant/firebase_constant.dart';
import 'package:firebase_firestore/app/modules/user_data/model/user_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<UserModel> userDataList = [];
  String documentID = '';

  Future<void> getUserData() async {
    try {
      QuerySnapshot querySnapshot = await userCollection.get();
      querySnapshot.docs.forEach((document) {
        final userModel =
            UserModel.fromMap(document.data() as Map<String, dynamic>);
        userDataList.add(userModel);
      });
      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  Future<void> ismailData() async {
    try {
      QuerySnapshot querySnapshot =
          await userCollection.where('name', isEqualTo: 'Ismail').get();
      querySnapshot.docs.forEach((document) {
        documentID = document.id;

        UserModel userModel =
            UserModel.fromMap(document.data() as Map<String, dynamic>);
        Get.snackbar('Success', 'Data fetch successfully');
        if (kDebugMode) {
          print(documentID);
          print(userModel.name);
        }
        getDocumentData(documentID);
      });
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      if (kDebugMode) {
        print(exception);
      }
    }
  }

  Future<void> getDocumentData(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await userCollection.doc(documentId).get();

      if (documentSnapshot.exists) {
        UserModel userModel =
            UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);

        print("User Name: ${userModel.name}");
        print("User Email: ${userModel.email}");
      } else {
        print("Document not found.");
      }
      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> getUsersByLanguageProficiency() async {
    try {
      QuerySnapshot querySnapshot = await userCollection.where(
          'languageProficiency',
          whereIn: ['Pashto', 'Urdu', 'English']).get();

      querySnapshot.docs.forEach((document) {
        UserModel userModel =
            UserModel.fromMap(document.data() as Map<String, dynamic>);

        print("User Name: ${userModel.name}");
      });

      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> get2UsersByLanguageProficiency() async {
    try {
      QuerySnapshot querySnapshot = await userCollection
          .where('languageProficiency', whereIn: ['Pashto', 'Urdu', 'English'])
          .limit(2)
          .get();

      querySnapshot.docs.forEach((doc) {
        DocumentReference docReference = doc.reference;

        UserModel userModel =
            UserModel.fromMap(doc.data() as Map<String, dynamic>);

        print("Document ID: ${docReference.id}");
        print("User Name: ${userModel.name}");
      });

      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> getUsersOrderByAge() async {
    try {
      QuerySnapshot querySnapshot =
          await userCollection.orderBy('age', descending: false).get();

      querySnapshot.docs.forEach((doc) {
        UserModel userModel =
            UserModel.fromMap(doc.data() as Map<String, dynamic>);

        if (kDebugMode) {
          print("User Name: ${userModel.name}");
        }
        print("User Age: ${userModel.age}");
      });

      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> getUsersByAgeRange(int lowerAge, int upperAge) async {
    try {
      // Query for documents where the age is between 10 and 20
      QuerySnapshot querySnapshot = await userCollection
          .where('age', isGreaterThanOrEqualTo: lowerAge)
          .where('age', isLessThanOrEqualTo: upperAge)
          .get();

      // Loop through the documents and process them
      querySnapshot.docs.forEach((document) {
        // Access the data of each document
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Now you can use the data as needed
        print("User Name: ${data['name']}");
        print("User Age: ${data['age']}"); // Example usage
      });

      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }

  Future<void> getUsersByAgeAndCompanyRange(
      int startAge, String startCompany, int endAge, String endCompany) async {
    try {
      // Query for documents where age is between startAge and endAge,
      // and company is between startCompany and endCompany
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('age')
          .orderBy('company')
          .startAt([startAge, startCompany]).endAt([endAge, endCompany]).get();

      // Loop through the documents and process them
      querySnapshot.docs.forEach((doc) {
        // Access the data of each document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Now you can use the data as needed
        print("User Name: ${data['name']}");
        print("User Age: ${data['age']}");
        print("User Company: ${data['company']}"); // Example usage
      });

      Get.snackbar('Success', 'Data fetch successfully');
    } catch (exception) {
      Get.snackbar('Fail', exception.toString());
      print(exception);
    }
  }
}