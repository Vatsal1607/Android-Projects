import 'package:flutter/material.dart';

class otpValue extends ChangeNotifier{
  String _value = '';

  String get value => _value;

  set value (String val){
    _value = val;
    notifyListeners();
  }
}