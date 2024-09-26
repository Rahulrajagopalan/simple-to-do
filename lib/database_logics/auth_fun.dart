import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_todo_app/models/user_model.dart';

class AuthFun {
  var authInst = FirebaseAuth.instance;
  // Create User
  Future<String> createUser(String email, String password, UserModel user) async {
    String userID = "";
    try {
      await authInst
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((cred) {
      String id = cred.user!.uid;
      userID = id;
    });
    } catch (e) {
      log("Error is : $e");
    }
    return userID;
  }
  // SignIn user
  Future<String> logingIn(String email, String password) async {
    String userID = "";
    try {
      await authInst.signInWithEmailAndPassword(email: email, password: password).then((cred){
        String id = cred.user!.uid;
        userID = id;
      });
    } catch (e) {
      log("Error while logging In: $e");
    }
    return userID;
  }
  // Logout User
  Future<String> loggingOut() async {
    String logoutID = authInst.currentUser!.uid;
    authInst.signOut();
    return logoutID;
  }
}
