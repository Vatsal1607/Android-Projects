import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('Here to get', style: TextStyle(fontSize: 30, color: Colors.brown),),
                  Text('Welcomed', style: TextStyle(fontSize: 30, color: Colors.black),),

                  SizedBox(height: 80,),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Enter your name',style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Please Enter correct name";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    decoration: InputDecoration(
                        label: Text('Enter your phone number',style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value!)){
                        return "Enter correct phone number";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    decoration: InputDecoration(
                        label: Text('Enter your Email',style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[\w\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                        return "Please Enter correct Email";
                      } else {
                        return null;
                      }
                    },
                  ),

                  SizedBox(height: 60,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              // check if form data are valid
                              // your process task ahead if all data are valid
                              final snackBar = SnackBar(content: Text('Submiting form...'));
                              // _scaffoldKey.currentState!.showSnackBar(snackBar);
                            }
                          },
                          child: Text('Submit'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

