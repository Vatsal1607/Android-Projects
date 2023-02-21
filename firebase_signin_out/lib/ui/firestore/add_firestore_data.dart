import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_signin_out/utils/utils.dart';
import 'package:firebase_signin_out/widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({Key? key}) : super(key: key);

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {

  final postController = TextEditingController();
  bool loading = false;
  // final databaseRef = FirebaseDatabase.instance.ref('Post');
  final fireStore = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Firestore Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              TextFormField(
                controller: postController,
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: 'What is in your mind',
                    border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30,),
              RoundButton(
                  title: 'Add',
                  loading: loading,
                  onTap: (){
                    setState(() {
                      loading = true;
                    });
                    String id = DateTime.now().millisecondsSinceEpoch.toString();
                    fireStore.doc(id).set({
                      'title': postController.text.toString(),
                      'id': id
                    }).then((value) {
                      Utils().toastMessage('Poast added in FireStore');
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading = false;
                      });
                    });
                  }),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.network('https://www.designcap.com/res/template/medium/4f148fbb5281743b4bbe4986ed732dcc/page0.jpg?v=1602654193')),
            ],
          ),
        ),
      ),
    );
  }
}
