import 'package:flutter/material.dart';

class FunProvider extends ChangeNotifier {
  bool obs = true;
  void obsText() {
    obs = !obs;
    notifyListeners();
  }

  Color changeColor = Colors.brown;
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.black
  ];
  int currentIndex = -1;

  void toggleColor() {
    currentIndex = (currentIndex + 1) % colorList.length;
    changeColor = colorList[currentIndex];
    notifyListeners();
  }
}
