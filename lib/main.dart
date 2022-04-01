// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './screens/transaction/create_transaction.dart';
import './screens/transaction/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: TextStyle(
             fontFamily: 'Opensans',
             fontWeight: FontWeight.bold,
             fontSize: 18
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Opensans')), )
      ),
      home: MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(id: "1", title: 'Transaction 1', amount: 99.99, date: DateTime.now()),
    // Transaction(id: "2", title: 'Transaction 2', amount: 29.99, date: DateTime.now()),
    // Transaction(id: "3", title: 'Transaction 3', amount: 39.99, date: DateTime.now()),
    // Transaction(id: "4", title: 'Transaction 4', amount: 49.99, date: DateTime.now()),
  ];

  void _createTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _openCreateTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: CreateTransaction(_createTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add), 
              onPressed: () => _openCreateTransactionModal(context)
            ),
          ],
        ),
        body: TransactionsList(_transactions),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openCreateTransactionModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ); 
  }
}
