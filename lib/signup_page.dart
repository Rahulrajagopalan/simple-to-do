import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(title: Text("Back to Login"),backgroundColor: Colors.grey[400],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Welcome to do...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Full name"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: placeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Place"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter email"),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<FunProvider>(
                builder: (context, funProvider, child) {
                  return TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              funProvider.obsText();
                              log(funProvider.obs.toString());
                            },
                            icon: funProvider.obs
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye_rounded))),
                    obscureText: funProvider.obs,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 5),
                    child: TextButton(
                        onPressed: () {
                          log(emailController.text);
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}