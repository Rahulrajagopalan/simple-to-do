import 'package:flutter/material.dart';
import 'package:simple_todo_app/controller/validation.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.validate,
      required this.controller,
      this.sufIcon,
      this.onpressing,
      this.isObs});

  final Function validate;
  final TextEditingController controller;
  final Icon? sufIcon;
  final Function? onpressing;
  final bool? isObs;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter a value";
        } else if (!validate(value)) {
          return "Enter a valid email";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter email",
          suffixIcon: IconButton(
              onPressed: () {
                onpressing;
              },
              icon: sufIcon!)),
              obscureText: isObs!,
    );
  }
}
