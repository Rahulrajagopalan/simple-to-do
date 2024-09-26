import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/controller/fun_provider.dart';

class ColorOfChange extends StatelessWidget {
  const ColorOfChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FunProvider>(builder: (context, funProvide, child) {
        return Container(
          color: funProvide.changeColor,
          child: Center(
            child: ElevatedButton(
                onPressed: funProvide.toggleColor,
                child: Text("Change Background")),
          ),
        );
      }),
    );
  }
}
