import 'package:chatapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email, String password) async {
    late bool select;
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Utils.toastMessage("Successfull"),
              select = true,
            })
        .onError((error, stackTrace) => {
              Utils.toastMessage(error.toString()),
              select = false,
            });
    return select;
  }

  Future<bool> login(String email, String password) async {
    late bool select;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              Utils.toastMessage("Successfull"),
              select = true,
            })
        .onError((error, stackTrace) => {
              Utils.toastMessage(error.toString()),
              select = false,
            });
    return select;
  }

  Future<bool> checkUser() async {
    late bool select;
    if (await _auth.currentUser != null) {
      select = true;
    } else {
      select = false;
    }
    return select;
  }
}
