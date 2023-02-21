import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup_hm2/loginPage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Signup',
      theme: ThemeData(),
      home: SafeArea(child: const LoginPage()),
    );
  }
}
