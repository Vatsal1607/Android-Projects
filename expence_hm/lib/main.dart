import 'package:expence_hm/Transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter expence',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // _MyHomePageState createState() => _MyHomePageState();
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction = [
    Transaction(
        id: 'a',
        title: 'Wrestler',
        amount: 500,
        dateTime: DateTime.now()
    ),
    Transaction(
        id: 'b',
        title: 'Athlete',
        amount: 48,
        dateTime: DateTime.now()
    ),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String title, double amount){
    print(title);
    print(amount);
    var newTr = Transaction(
        id: 'a',
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
        title: const Text('My Expence'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title here'
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                      hintText: 'Enter amount here'
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      _addTransaction(titleController.text, double.parse(amountController.text));
                    },
                    child: const Text('Submit')
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
          ),
        ],
      ),
    );
  }
}

