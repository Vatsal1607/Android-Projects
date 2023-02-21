import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

late Map mapresponse;
late Map dataresponse;
late List listitems;
Future callApi() async{
  Response response = await get(Uri.parse('https://reqres.in/api/users?page=2'));
  if(response.statusCode == 200)
    {
      setState(() {
        print(response.body);
        mapresponse = jsonDecode(response.body);
        listitems = mapresponse['data'];
      });
    }
}

void initState(){
  callApi();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User data'),
      ),
      body: ListView.builder(
          itemCount: listitems.length,
        itemBuilder: (context, index){
            return Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Card(
                            elevation: 10,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            color: Colors.purpleAccent,
                            child: Text(listitems[index]['id'].toString(),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),),
                          ),
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            color: Colors.amber,
                            child: Text(listitems[index]['email'], style: TextStyle(
                                fontSize: 20
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(listitems[index]['first_name'] , style: TextStyle(
                              fontSize: 25
                          ),),
                          Text(listitems[index]['last_name'], style: TextStyle(
                              fontSize: 25
                          ),),
                          Image.network(listitems[index]['avatar'],),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}

