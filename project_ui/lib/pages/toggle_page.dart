import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleDemo extends StatefulWidget {
  const ToggleDemo({Key? key}) : super(key: key);
  @override
  State<ToggleDemo> createState() => _ToggleDemoState();
}

class _ToggleDemoState extends State<ToggleDemo> {

  List<String> labels = ['Client', 'Candidate'];
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle demo'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ToggleSwitch(
                labels: labels,
                minWidth: 150.0,
                onToggle: (index){
                    isVisible = !isVisible;
                    setState(() { });
                },
              ),
              isVisible ? Container(child: Text('Client')) : Container(child: Text('Candidate'),)
            ],
          ),
        ),
      ),
    );
  }
}
