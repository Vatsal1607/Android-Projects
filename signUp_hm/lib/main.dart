import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(signUp());
}

class signUp extends StatelessWidget {
  // const signUp({Key? key}) : super(key: key);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // void validate(){
  //   if(formkey.currentState.()){
  //     print("Validated");
  //   } else {
  //     print("Not validated");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(
                color: Colors.cyanAccent,
                // height: 1000,
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Text('Sign Up',
                        style: TextStyle(
                            fontSize: 30),
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter correct Name';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Enter Name here babs',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        validator: (value){
                          if(value!.length != 10){
                            return 'Number is not valid';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter Number here babs',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Enter Email babs',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                        // validator: (value){
                        //   // if(value!.isEmpty){
                        //   //   return 'Enter correct Email';
                        //   // } else {
                        //   //   return null;
                        //   // }
                        // },
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Password babs',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        // style: raisedButtonStyle,
                        onPressed: (){},
                        child: Text('Submit'),
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
