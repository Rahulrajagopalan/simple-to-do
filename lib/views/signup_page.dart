import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';
import 'package:simple_todo_app/database_logics/auth_fun.dart';
import 'package:simple_todo_app/database_logics/data_services.dart';
import 'package:simple_todo_app/models/user_model.dart';
import 'package:simple_todo_app/views/home_screen.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var auth = AuthFun();
  var dbService = DataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Back to Login"),
        backgroundColor: Colors.grey[400],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
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
                            log("email is: ${emailController.text}");
                            UserModel user = UserModel(
                                name: nameController.text,
                                place: placeController.text,
                                email: emailController.text,
                                password: passwordController.text);
                            auth
                                .createUser(emailController.text,
                                    passwordController.text, user)
                                .then((userID) {
                              dbService.storeUser(userID, user);
                            }).then((onValue) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            });
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
      ),
    );
  }
}
