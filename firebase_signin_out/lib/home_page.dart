// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   final GoogleSignIn googleSignIn = new GoogleSignIn();
//
//   // Future<User> _signIn() async {
//   //   GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   //   GoogleSignInAuthentication gSA = await googleSignInAccount!.authentication;
//   //
//   //   User user = await _auth.signInWithGoogle(
//   //     idToken: gSA.idToken, accessToken: gSA.accessToken
//   //   );
//   //   print('Username: ${user.displayName}');
//   //   return user;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Firebase Demo'),
//         centerTitle:  true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//                 onPressed: () => _signIn()()
//                     .then((UserCredential user) => print(user))
//                     .catchError((e) => print(e)),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.green)
//               ),
//                 child: Text('Sign in'),
//             ),
//             ElevatedButton(
//                 onPressed: (){},
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.red)
//                 ),
//                 child: Text('Sign out')
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
