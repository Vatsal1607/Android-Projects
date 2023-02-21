import 'package:api_tutorial/model/Article.dart';
import 'package:api_tutorial/widgets/NewsCardWidgets.dart';
import 'package:flutter/material.dart';

class NewsDescriptionPage extends StatelessWidget {
  final Article data;
  const NewsDescriptionPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsCardWidgets(article: data),
    );
  }
}
