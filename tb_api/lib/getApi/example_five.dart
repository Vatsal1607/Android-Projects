import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class exampleFive extends StatefulWidget {
  const exampleFive({Key? key}) : super(key: key);

  @override
  State<exampleFive> createState() => _exampleFiveState();
}

class _exampleFiveState extends State<exampleFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TB API 5'),
        centerTitle: true,
      ),
    );
  }
}
