import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin_out/ui/auth/login_screen.dart';
import 'package:firebase_signin_out/ui/posts/post_screen.dart';
import 'package:firebase_signin_out/ui/upload_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../ui/firestore/firestore_list_screen.dart';

class SplashServices{

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user != null){
      Timer(const Duration(seconds: 1),  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()))
      // firestore:
      // Timer(const Duration(seconds: 1),  () => Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreScreen()))
      // Upload image:
      // Timer(const Duration(seconds: 1),  () => Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageScreen()))
      );
    } else {
      Timer(const Duration(seconds: 1),  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
      );
    }
  }
}