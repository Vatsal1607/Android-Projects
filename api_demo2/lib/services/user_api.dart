import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';


class UserApi{
  static Future<List<User>> fetchUsers() async {
    print('FetchUsers called');
    final res = await http.get(Uri.parse("https://randomuser.me/api/?results=15"));
    var result = jsonDecode(res.body);
    // print(result);
    final results = result['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}