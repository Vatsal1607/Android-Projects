import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                color: Colors.blue[100],
                height: 1000,
              ),
              widget(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text('Login', style: TextStyle(
                        fontSize: 35),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      // Image.asset('images/baby_panther.jpg'),
                      CircleAvatar(
                        radius: 70,
                        foregroundImage: AssetImage('images/baby_panther.jpg'),
                      )
                      // ClipOval(
                      //   child: Image.asset('images/baby_panther.jpg', height: 200, width: 200, fit: BoxFit.fill),
                      // )
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
                          hintText: 'number',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
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
                          hintText: 'number',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton
                        (onPressed:(){
                        if(formKey.currentState!.validate()){
                          print('Done Babs...');
                        } else {
                          print('something is wrong bitch');
                        }
                      },
                          child: Text('Submit')
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()),
                        },
                        child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 35),
                        ),
                      )
                      Text('SignUp',
                      style: TextStyle(
                        fontSize: 35
                      ),)
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
