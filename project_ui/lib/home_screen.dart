import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visibility widget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isVisible ? Container(
            height: 100,
            width: 100,
            color: Colors.deepPurple,
            child: Text('Client form visible'),
          ) : Container(
            height: 100,
            width: 100,
            color: Colors.deepPurple,
            child: Text('Candidate'
                ' form visible'),
          ),
          SizedBox(height: 20.0,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            }, child: isVisible ? Text('Candidate Form') : Text('Client Form')),
          ),
        ],
      ),
    );
  }
}
