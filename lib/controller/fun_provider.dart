import 'package:flutter/material.dart';

class FunProvider extends ChangeNotifier{
  bool obs = true;
  void obsText(){
    obs = !obs;
    notifyListeners();
  }
}