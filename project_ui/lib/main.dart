import 'package:flutter/material.dart';
import 'package:project_ui/home_screen.dart';
import 'package:project_ui/pages/temp.dart';
import 'package:project_ui/pages/toggle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToggleDemo(),
    );
  }
}
