import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';
import 'package:simple_todo_app/controller/validation.dart';
import 'package:simple_todo_app/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();
  final validate = Validation();

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
                    if(value == null || value.isEmpty){
                      return "Enter a value";
                    }
                    else if(!validate.isValidEmail(value)){
                      return "Enter a valid email";
                    }
                    return null;
                  },
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
                            if(formKey.currentState!.validate()){
                              log(emailController.text);
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    )),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
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
