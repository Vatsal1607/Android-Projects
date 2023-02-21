import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/UserModel.dart';

class exampleThree extends StatefulWidget {
  const exampleThree({Key? key}) : super(key: key);

  @override
  State<exampleThree> createState() => _exampleThreeState();
}

class _exampleThreeState extends State<exampleThree> {

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TB API 3'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
                  // return Text('No data found');
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index){
                          return Card(
                            elevation: 5,
                            color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                  ReusableRow(title: 'Username', value: snapshot.data![index].username.toString()),
                                  ReusableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                                  ReusableRow(title: 'Address', value: snapshot.data![index].address!.geo!.lat.toString()),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  }
                }
              )
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold
          ),),
          const SizedBox(width: 10,),
          Text(value, style: TextStyle(
              fontSize: 20,
              wordSpacing: 20
          ),
          ),
        ],
      ),
    );
  }
}