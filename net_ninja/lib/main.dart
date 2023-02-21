import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_ninja/quote.dart';
import 'package:net_ninja/quote_card.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'oscar wilde', author: 'Be yourself, everyone else is already taken'),
    Quote(text: 'oscar wilde', author: 'I have nothing to declare except my genius'),
    Quote(text: 'oscar wilde', author: 'The truth is rarely pure and never simple'),
    Quote(text: 'oscar wilde', author: 'The truth is rarely pure and never simple'),
    Quote(text: 'oscar wilde', author: 'The truth is rarely pure and never simple'),
    Quote(text: 'oscar wilde', author: 'The truth is rarely pure and never simple'),
    Quote(text: 'oscar wilde', author: 'The truth is rarely pure and never simple'),
  ];

  // Widget quoteTemplate(quote){
  //   return QuoteCard(quote: quote);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: quotes.map((quote) => QuoteCard(
              quote: quote,
              delete: (){
                setState(() {
                  quotes.remove(quote);
                });
              }
            )
          ).toList(),
        ),
      ),
    );
  }
}