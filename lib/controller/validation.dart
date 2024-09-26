import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_todo_app/views/home_screen.dart';
import 'package:simple_todo_app/views/login_page.dart';

class Validation {
  // validations
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)? true: false;
  }

  dynamic isValidPass(String pass) {
    if (pass.length < 6) {
      return "required atleast 6 charactors";
    } else if (!pass.contains(RegExp(r'[A-Z]'), 0)) {
      return "Capital letter required";
    } else if (!pass.contains(RegExp(r'[0-9]'), 0)) {
      return "Number required";
    } else {
      return null;
    }
  }

  // Shared prefrences
  static const String keyLogin = "login";

  void setKeyLogin() async {
    var sharedPre = await SharedPreferences.getInstance();
    sharedPre.setBool(keyLogin, true);
  }

  void getKeyLogin(BuildContext context) async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    var login = sharedPre.getBool(keyLogin);
    log("$login");
    if (login != null && login) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Logged In Succesfully")));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  void outKeyLogin(BuildContext context) async {
    var sharedPre = await SharedPreferences.getInstance();
    sharedPre.remove(keyLogin).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Logged Out Succesfully")));
    });
  }
}
