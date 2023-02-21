import 'package:api_tutorial/model/Article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCardWidgets extends StatelessWidget {
  final Article article;
  const NewsCardWidgets({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            '${article.urlToImage}',
            fit: BoxFit.fill,
          ),
        ),
        Text(article.title, style: TextStyle(fontSize: 20),),
        Text(article.description)
      ],
    );
  }
}
