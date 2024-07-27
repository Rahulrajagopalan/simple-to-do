import 'package:flutter/material.dart';
import 'package:simple_todo_app/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false);
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
