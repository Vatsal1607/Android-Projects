import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_signin_out/ui/auth/login_screen.dart';
import 'package:firebase_signin_out/ui/posts/add_posts.dart';
import 'package:firebase_signin_out/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
          }, icon: const Icon(Icons.logout_outlined)),
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
            controller: searchFilter,
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
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: const Center(child: CircularProgressIndicator()),
                itemBuilder: (context, snapshot, animation, index){

                  final title = snapshot.child('title').value.toString();
                  if(searchFilter.text.isEmpty){
                    return ListTile(
                      title:  Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(title, snapshot.child('id').value.toString());
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              )
                          ),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  ref.child(snapshot.child('id').value.toString()).remove();
                                },
                                leading: const Icon(Icons.delete_outline),
                                title: const Text('Delete'),
                              )
                          ),
                        ],
                      ),
                    );
                  } else if(title.toLowerCase().contains(searchFilter.text.toLowerCase())){
                    return ListTile(
                      title:  Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Update'),
          content: Container(
            child: TextFormField(
              controller: editController,
            ),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Cancel')
            ),
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  ref.child(id).update({
                    'title': editController.text.toString(),
                  }).then((value) {
                    Utils().toastMessage('Post Updated');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                child: const Text('Update')
            ),
          ],
        );
      },
    );
  }
}
