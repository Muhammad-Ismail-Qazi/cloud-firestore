
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;

CollectionReference userCollection= firebaseFirestore.collection("Users");