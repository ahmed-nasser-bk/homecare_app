import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_care_app/models/orderModel.dart';
import '../models/userModel.dart';

class DataService {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  //set user data
  Future setUserData(UserModel userModel) async {
    return await db.collection('users').doc(uid).set(userModel.toMap());
  }

  //set order 
  Future setOrder(OrderModel orderModel) async {
    return await db.collection('orders').doc().set(orderModel.toMap());
  }

  //delete a single document order
  Future deleteDocument(String docID) async {
    await db.collection('orders').doc(docID).delete();
  }

  //get current user data stream
  Stream<UserModel> get currentUserData {
    return db.collection('users').doc(uid).snapshots().map(
      (snapshot) => UserModel.fromMap(snapshot.data() as Map<String, dynamic>)
    );
  }

}