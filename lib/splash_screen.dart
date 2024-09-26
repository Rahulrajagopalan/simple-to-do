import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_todo_app/controller/validation.dart';
import 'package:simple_todo_app/views/home_screen.dart';
import 'package:simple_todo_app/views/login_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // String keyLogin = Validation.keyLogin;
  var vali = Validation();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      vali.getKeyLogin(context);
    });
    return Scaffold(
      body: Center(
        child: Text(
          "To Do App",
          style: TextStyle(
              color: Colors.black45, fontStyle: FontStyle.italic, fontSize: 40),
        ),
      ),
    );
  }
}
