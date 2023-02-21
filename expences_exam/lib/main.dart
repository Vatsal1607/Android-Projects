import 'package:expences_exam/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutt exp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction = [
    Transaction(
        id: 'aa',
        title: 'movies',
        amount: 55,
        dateTime: DateTime.now()
    ),
    Transaction(
        id: 'bb',
        title: 'actor',
        amount: 11,
        dateTime: DateTime.now()
    ),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String title, double amount){
    print(title);
    print(amount);
    var newTr = Transaction(
        id: 'id',
        title: title,
        amount: amount,
        dateTime: DateTime.now()
    );
    setState(() {
      transaction.add(newTr);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mine expence'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      _addTransaction(titleController.text, double.parse(amountController.text));
                    },
                    child: Text('Submit')
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: transaction.length,
                itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Text('${transaction[index].id}'),
                      title: Text('${transaction[index].title}'),
                      subtitle: Text(DateFormat.yMMMd().format(transaction[index].dateTime)),
                      trailing: Text('${transaction[index].amount}'),
                    );
                },
              )
          )
        ],
      ),
    );
  }
}
