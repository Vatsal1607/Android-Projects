import 'package:flutter/material.dart';
import 'package:tb_api/getApi/example_five.dart';
import 'package:tb_api/getApi/example_four.dart';
import 'package:tb_api/getApi/example_three.dart';
import 'package:tb_api/getApi/example_two.dart';
import 'package:tb_api/getApi/home_screen.dart';
import 'package:tb_api/postApi/signup.dart';
import 'package:tb_api/postApi/upload_image.dart';
import 'package:tb_api/temp/homeScreen2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TB API',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: const SignUpScreen(),
      home: const SignUpScreen(),
    );
  }
}