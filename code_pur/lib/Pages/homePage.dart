import 'package:code_pur/models/catalog.dart';
import 'package:code_pur/utils/routes.dart';
import 'package:code_pur/widgets/homeWidgets/catalog_header.dart';
import 'package:code_pur/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/homeWidgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 15;

  final String name = "Vatsal";
  @override
  void initState() {

    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
      await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    setState(() {
    });
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(5, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart, color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ],
          ),

        ),
      ),
    );
  }
}
