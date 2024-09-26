import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';
import 'package:simple_todo_app/controller/validation.dart';
import 'package:simple_todo_app/custom/custom_textformfield.dart';
import 'package:simple_todo_app/database_logics/auth_fun.dart';
import 'package:simple_todo_app/views/home_screen.dart';
import 'package:simple_todo_app/views/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final validate = Validation();
  final auth = AuthFun();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      // appBar: AppBar(title: Text("Login page"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Login to do...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      log(value!);
                      return "Enter a value";
                    } else if (!validate.isValidEmail(emailController.text)) {
                      log(value);
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<FunProvider>(
                  builder: (context, funProvider, child) {
                    return TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        return validate.isValidPass(value);
                      },
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
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // log(emailController.text);
                            // validate.setKeyLogin();
                            // // formKey.currentState!.reset();
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (context) => HomeScreen()));
                            auth
                                .logingIn(emailController.text,
                                    passwordController.text)
                                .then((value) {
                              log("SignedIn: $value");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("LoggedIn Succesfully")));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 5),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password",
                          style: TextStyle(color: Colors.black),
                        )),
                    Spacer(),
                    // Text("Have an account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
