import 'package:chatapp/Models/userModel.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  final _fireStore = FirebaseFirestore.instance.collection('Users');
  late FirebaseAuth _auth;

  Future<bool> updateUserDetails(
      String name, String phone, String gender) async {
    _auth = FirebaseAuth.instance;
    bool result = false;
    UserModel user = UserModel(
        id: _auth.currentUser!.uid,
        name: name,
        phone: phone,
        email: _auth.currentUser!.email.toString(),
        gender: gender);
    await _fireStore
        .doc(_auth.currentUser!.uid.toString())
        .set(user.toJson())
        .then((value) => {
              result = true,
            })
        .onError((error, stackTrace) => {
              Utils.toastMessage(error.toString()),
              result = false,
            });
    return result;
  }

  Future<bool> chechUserProfile() async {
    _auth = FirebaseAuth.instance;
    DocumentSnapshot docSnapshot =
        await _fireStore.doc(_auth.currentUser?.uid.toString()).get();
    bool result;
    if (docSnapshot.exists) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }

  Future<void> getApiKey() async {
    await FirebaseFirestore.instance
        .collection('Gemini')
        .doc('Api')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String api = documentSnapshot['key'].toString();
        Gemini.init(apiKey: api);
      } else {
        // Handle the case when the document does not exist
        return ''; // You can provide a default value or handle it as needed
      }
    });
  }
}
