import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin_out/utils/utils.dart';
import 'package:firebase_signin_out/widgets/round_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',

              ),
            ),
            const SizedBox(height: 40,),
            RoundButton(
                title: 'Forgot',
                onTap: (){
                  auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                    Utils().toastMessage('Mail sent');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}
