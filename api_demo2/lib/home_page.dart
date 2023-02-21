import 'package:api_demo2/model/user.dart';
import 'package:api_demo2/services/user_api.dart';
import 'package:flutter/material.dart';

import 'model/user_name.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<User> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API\'s'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (context, index){
          final user = users[index];
          final gender = user.gender;
          final color = user.gender == 'male' ? Colors.yellowAccent : Colors.pink;
            return ListTile(
              // leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(user.fullName),
              subtitle: Text(user.location.country),
            );
          }
      ),
    );
  }
}

