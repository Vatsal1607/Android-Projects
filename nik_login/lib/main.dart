import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nik_login/otp_ui_2.dart';

import 'home_page.dart';
// import 'package:login_registration/SignUpPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OtpUI2(),
      home: HomePage(),
    );
  }
}
