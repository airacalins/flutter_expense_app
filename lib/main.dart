// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:personal_expense/models/transaction.dart';
import 'package:personal_expense/screens/transaction/create_transaction.dart';
import 'package:personal_expense/screens/transaction/transaction_list.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(title: Text('My Personal Expenses')),
        body: TransactionList()
      ),
    );
  }
}
