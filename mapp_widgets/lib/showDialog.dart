import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Close')
                  )
                ],
                title: Text('Flutter mapp'),
                content: Text('This is the alert dialog'),
              )
          );
        },
        child: Text('Show alert dialog'),
      ),
    );
  }
}
