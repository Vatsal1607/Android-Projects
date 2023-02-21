import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class exampleFour extends StatefulWidget {
  const exampleFour({Key? key}) : super(key: key);

  @override
  State<exampleFour> createState() => _exampleFourState();
}

class _exampleFourState extends State<exampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TB API 4'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                ReusableRow(title: 'Name', value: data[index]['name'].toString()),
                                ReusableRow(title: 'Username', value: data[index]['username'].toString()),
                                ReusableRow(title: 'Address', value: data[index]['address']['street'].toString()),
                                
                              ],
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