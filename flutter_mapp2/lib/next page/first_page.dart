import 'package:flutter/material.dart';
import 'package:flutter_mapp2/next%20page/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second mapp'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return const SecondPage();
            },),);
          },
          child: const Text('Press'),
        ),
      ),
    );
  }
}