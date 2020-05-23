import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  int _count = 0;
  int _red = 0;
  int _green = 0;
  int _blue = 0;
  double _turn = 0;

  int get count => 0;
  int get red => 0;
  int get green => 0;
  int get blue => 0;
  double get turn => 0;

  void updateColorRed(value){
    _red = value.round();
    notifyListeners();
  }
  void updateColorGreen(value){
    _green = value.round();
    notifyListeners();
  }
  void updateColorBlack(value){
    _blue = value.round();
    notifyListeners();
  }
  void updateValue(value){
    _count = value.round();
    notifyListeners();
  }

  Color getColor(String color){
    if(color == 'red')
      return Color.fromRGBO(_red, 0, 0, 1);
    else if(color == 'green')
      return Color.fromRGBO(0, _green, 0, 1);
    else
      return Color.fromRGBO(0, 0, _blue, 1);
  }


}