import 'package:flutter/material.dart';

import 'next_page.dart';

class MyAppExt extends StatefulWidget {
  const MyAppExt({Key? key}) : super(key: key);

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {

  String buttonName = 'Click';
  int currentIndex = 0;
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Mapp'),
        centerTitle: true,
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    print('You pressed Text Button');
                    // setState(() {
                    //   buttonName = 'Clicked';
                    // });
                  },
                  child: Text('Click')),
              OutlinedButton(
                  onPressed: () {
                    print('You pressed Outlined Button');
                    setState(() {
                      buttonName = 'Clicked';
                    });
                  },
                  child: Text(buttonName)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (contexty) => NextPage()),);
                  },
                  child: Text('Next page'))
            ],
          ),
        )
            : GestureDetector(
          onTap: (){
            setState(() {
              _isClicked = !_isClicked;
            });
          },
          child: _isClicked ? Image.network(
              'https://qph.cf2.quoracdn.net/main-qimg-ea57faf8fe8ba042094fbd2dce394e71-lq') : Image.asset('assets/images/samantha.jpg'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorite'
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}