import 'dart:convert';
import 'package:api_tutorial/model/Article.dart';
import 'package:http/http.dart';

class ApiService{
  final endpoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-11-27&sortBy=publishedAt&apiKey=6e50f69c6fd44537a07e88db34ee4b79";
  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw 'Data not found';
    }
  }
}