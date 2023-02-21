import 'package:flutter/material.dart';
import 'package:mapp_widgets/showDialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All widgets trial'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                _bool = !_bool;
              });
            },
              child: const Text('Switch', style: TextStyle(
              fontSize: 15,),
            ),
            ),
            AnimatedCrossFade(
                firstChild: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLL5c6rGjYSifr2VGowNOQibF0am02gpG8FQ&usqp=CAU'),
                secondChild: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfBOVcuDW8UzXVoCZ6uveBasLKtRixGyYMnA&usqp=CAU'),
                crossFadeState: _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
