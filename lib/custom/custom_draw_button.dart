import 'package:flutter/material.dart';

class CustomDrawButton extends StatelessWidget {
  CustomDrawButton(
      {super.key, required this.buttonName, required this.navigatePage});
  String buttonName;
  Widget navigatePage;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => navigatePage));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
              child: Text(
                buttonName,
                style: TextStyle(color: Colors.white),
              ),
            )));
  }
}
