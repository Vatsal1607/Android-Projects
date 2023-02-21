import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_signin_out/ui/firestore/add_firestore_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_signin_out/ui/auth/login_screen.dart';
import 'package:firebase_signin_out/ui/posts/add_posts.dart';
import 'package:firebase_signin_out/utils/utils.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {

  final auth = FirebaseAuth.instance;
  // final ref = FirebaseDatabase.instance.ref('Post');
  // final searchFilter = TextEditingController();
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('user').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireStore', style: TextStyle(
          letterSpacing: 3
        ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined)),
          const SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Web Series', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
            ),),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(height: 10,),
          TextFormField(
            // controller: searchFilter,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder()
            ),
            onChanged: (String value){
              setState(() {

              });
            },
          ),
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

                if(snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();

                if(snapshot.hasError)
                  return Text('Some error');

                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            onTap: (){
                              // Update data:
                              // ref.doc(snapshot.data!.docs[index]['id'].toString()).update({
                              //   'title': 'Roman Reigns'
                              // }).then((value) {
                              //   Utils().toastMessage('Updated');
                              // }).onError((error, stackTrace) {
                              //   Utils().toastMessage(error.toString());
                              // });

                              // Delete data:
                              // ref.doc(snapshot.data!.docs[index]['id'].toString()).delete().then((value) {
                              //   Utils().toastMessage('Deleted');
                              // }).onError((error, stackTrace) {
                              //   Utils().toastMessage(error.toString());
                              // });
                            },
                            title: Text(snapshot.data!.docs[index]['title'].toString()),
                            subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
                            trailing: IconButton(
                                icon: Icon(Icons.delete), onPressed: () {
                                  ref.doc(snapshot.data!.docs[index]['id'].toString()).delete().then((value) {
                                    Utils().toastMessage('Deleted');
                                  }).onError((error, stackTrace) {
                                    Utils().toastMessage(error.toString());
                                  });
                              },
                            ),
                            // trailing: PopupMenuButton(
                            //   icon: Icon(Icons.more_vert),
                            //   itemBuilder: (context) => [
                            //     PopupMenuItem(
                            //       value: 1,
                            //         child: ListTile(
                            //           onTap: (){
                            //             Navigator.pop(context);
                            //
                            //           },
                            //           leading: Icon(Icons.edit),
                            //           title: Text('Edit'),
                            //         )
                            //     ),
                            //     PopupMenuItem(
                            //         value: 2,
                            //         child: ListTile(
                            //           onTap: (){
                            //             Navigator.pop(context);
                            //             showMyDialog(title, snapshot.data!.docs[index]['id'].toString());
                            //           },
                            //           leading: Icon(Icons.delete),
                            //           title: Text('Delete'),
                            //         )
                            //     ),
                            //   ],
                            // ),
                          ),
                        );
                      }
                  ),
                );
              }
          )

          // Another way to view list:
          // Expanded(
          //     child: StreamBuilder(
          //       stream: ref.onValue,
          //       builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
          //
          //         if(!snapshot.hasData){
          //           return Center(child: CircularProgressIndicator());
          //         } else {
          //
          //           Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
          //           List<dynamic> list = [];
          //           list.clear();
          //           list = map.values.toList();
          //           return ListView.builder(
          //               itemCount: snapshot.data!.snapshot.children.length,
          //               itemBuilder: (context, index){
          //                 return ListTile(
          //                   title: Text(list[index]['title']),
          //                   subtitle: Text(list[index]['id']),
          //                 );
          //               }
          //           );
          //         }
          //       },
          //     )
          // ),

          // const Divider(
          //   thickness: 5,
          //   color: Colors.black,
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFirestoreDataScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Future<void> showMyDialog(String title, String id) async {
  //   editController.text = title;
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context){
  //         return AlertDialog(
  //           title: Text('Update'),
  //           content: Container(
  //             child: TextFormField(
  //               controller: editController,
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: (){
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('Cancel')
  //             ),
  //             TextButton(
  //                 onPressed: (){
  //                   Navigator.pop(context);
  //                   ref.doc(id).update({
  //                     'title': editController.text.toString(),
  //                   }).then((value) {
  //                     Utils().toastMessage('Data upadted');
  //                   }).onError((error, stackTrace) {
  //                     Utils().toastMessage(error.toString());
  //                   });
  //                 },
  //                 child: Text('Update')
  //             ),
  //           ],
  //         );
  //       });
  // }

  // Future<void> showMyDialog(String title, String id) async {
  //   editController.text = title;
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context){
  //       return AlertDialog(
  //         title: const Text('Update'),
  //         content: Container(
  //           child: TextFormField(
  //             controller: editController,
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //               onPressed: (){
  //                 Navigator.pop(context);
  //               },
  //               child: const Text('Cancel')
  //           ),
  //           TextButton(
  //               onPressed: (){
  //                 Navigator.pop(context);
  //                 ref.child(id).update({
  //                   'title': editController.text.toString(),
  //                 }).then((value) {
  //                   Utils().toastMessage('Post Updated');
  //                 }).onError((error, stackTrace) {
  //                   Utils().toastMessage(error.toString());
  //                 });
  //               },
  //               child: const Text('Update')
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
