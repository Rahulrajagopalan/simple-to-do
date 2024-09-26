import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_todo_app/controller/validation.dart';
import 'package:simple_todo_app/custom/custom_draw_button.dart';
import 'package:simple_todo_app/custom/custom_textformfield.dart';
import 'package:simple_todo_app/custom/show_todo_sheet.dart';
import 'package:simple_todo_app/database_logics/auth_fun.dart';
import 'package:simple_todo_app/database_logics/data_services.dart';
import 'package:simple_todo_app/models/todo_model.dart';
import 'package:simple_todo_app/models/user_model.dart';
import 'package:simple_todo_app/views/login_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final auth = AuthFun();
  final dbService = DataServices();

  @override
  Widget build(BuildContext context) {
    // Validation vali = Validation();
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomDrawButton(
                  buttonName: "Most important",
                  navigatePage: Text("Important")),
              CustomDrawButton(
                  buttonName: "Catogory 1", navigatePage: Text("Important")),
              CustomDrawButton(
                  buttonName: "Catogory 2", navigatePage: Text("Important")),
              CustomDrawButton(
                  buttonName: "Catogory 3", navigatePage: Text("Important")),
              CustomDrawButton(
                  buttonName: "Catogory 4", navigatePage: Text("Important")),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("You sure to logout?"),
                        content: Text(
                            "All the data stored will be removed once you logout and cannot be restored"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                // vali.outKeyLogin(context);
                                auth.loggingOut().then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Logged Out")));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                });
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(color: Colors.blue[800]),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No",
                                style: TextStyle(color: Colors.blue[800]),
                              )),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
          color: const Color.fromRGBO(76, 175, 80, 1),
          child: StreamBuilder<List<TodoModel>>(
              stream: dbService.getToDoStream(auth.authInst.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  log("${snapshot.error}");
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No users"),
                  );
                }
                var todoData = snapshot.data!;
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var todo = todoData[index];
                      return Card(
                          elevation: 1,
                          child: InkWell(
                            onTap: () {
                              log("User is : ${todo.description}");
                            },
                            child: ListTile(
                              title: Text(todo.taskName),
                              trailing: IconButton(onPressed: (){
                                dbService.removeTodo(auth.authInst.currentUser!.uid, todo.todoId);
                              }, icon: Icon(Icons.delete)),
                            ),
                          ));
                    });
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return ShowToDoSheet();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
