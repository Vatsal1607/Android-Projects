import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Loginpage());
}

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(
                color: Colors.pinkAccent[100],
                height: 1000,
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),

                  child: Column(
                    children: [
                      Text('Login', style: TextStyle(
                        fontSize: 20),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      ClipOval(
                        child: Image.asset('images/Black_panther.jpg', height: 200, width: 200, fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      TextFormField(
                        validator: (value){
                          print('${value}');
                          if(value!.length != 10){
                            return 'Number is not valid';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter your Number here babs',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            if(formkey.currentState!.validate()){
                              print('Done hai babs');
                            } else {
                              print('Not submit bitch');
                            }
                          },
                          child: Text('Submit')
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Text('Sign up',
                        style: TextStyle(
                          fontSize: 35
                        ),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
