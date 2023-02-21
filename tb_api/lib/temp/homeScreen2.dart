import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tb_api/Models/posts_model.dart';

class homeScreen2 extends StatefulWidget {
  const homeScreen2({Key? key}) : super(key: key);

  @override
  State<homeScreen2> createState() => _homeScreen2State();
}

class _homeScreen2State extends State<homeScreen2> {

  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API HomeScreen 2'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text('Loading...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 30,),
                        CircularProgressIndicator(strokeWidth: 5, color: Colors.green,),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Title', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blueAccent
                                ),
                                ),
                                Text(postList[index].title.toString()),
                                const SizedBox(height: 20,),
                                const Text('Description', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue
                                ),),
                                Text(postList[index].body.toString()),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
                },
              )
          )
        ],
      ),
    );
  }
}
