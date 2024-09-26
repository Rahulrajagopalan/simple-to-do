import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:simple_todo_app/database_logics/auth_fun.dart';
import 'package:simple_todo_app/database_logics/data_services.dart';
import 'package:simple_todo_app/models/todo_model.dart';

class ShowToDoSheet extends StatelessWidget {
  ShowToDoSheet({super.key});
  TextEditingController taskNameController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final auth = AuthFun();
  final dbService = DataServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter task";
                  }
                  return null;
                },
                controller: taskNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Task"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Date";
                  }
                  return null;
                },
                controller: lastDateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Last Date"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter priority";
                  }
                  return null;
                },
                controller: priorityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Priority"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter description";
                  }
                  return null;
                },
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description"),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String todoId = randomAlphaNumeric(10);
                          TodoModel todoData = TodoModel(
                              taskName: taskNameController.text,
                              lastDate: lastDateController.text,
                              priority: priorityController.text,
                              description: descriptionController.text,
                              todoId: todoId);
                          dbService
                              .createTodo(auth.authInst.currentUser!.uid,
                                  todoId, todoData)
                              .then((onValue) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Created TODO")));
                          });
                        }
                      },
                      child: Text(
                        "Submit ToDo",
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
