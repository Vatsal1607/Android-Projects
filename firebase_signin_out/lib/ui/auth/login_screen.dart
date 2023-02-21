import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin_out/ui/auth/login_with_phone_number.dart';
import 'package:firebase_signin_out/ui/auth/signup_screen.dart';
import 'package:firebase_signin_out/ui/forgot_password.dart';
import 'package:firebase_signin_out/ui/posts/post_screen.dart';
import 'package:firebase_signin_out/utils/utils.dart';
import 'package:firebase_signin_out/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
          Utils().toastMessage(value.user!.email.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()));
          setState(() {
            loading = false;
          });
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email)
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_open)
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 50,),
              RoundButton(
                title: 'Login',
                loading: loading,
                onTap: () {
                    if(_formKey.currentState!.validate()){
                      login();
                    }
                },
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen(),));
                    },
                    child: const Text('Forgot password?')
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const SignupScreen(),));
                      },
                      child: const Text('Sign up')
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneNumber()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: const Center(
                    child: Text('Login with phone number'),
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
