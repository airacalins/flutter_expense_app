import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import '../transaction/create_transaction.dart';
import '../transaction/transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void _deleteTransaction(String id) {
    setState(() => _transactions.removeWhere((t) => t.id == id));
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
    final PreferredSizeWidget appBar = Platform.isIOS 
      ? CupertinoNavigationBar(
        middle: const Text("Personal Expenses"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          GestureDetector(
            child: const Icon(CupertinoIcons.add),
            onTap: () => _openCreateTransactionModal(context),
            )
        ]),
      )
      : AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _openCreateTransactionModal(context)),
        ],
      ) as PreferredSizeWidget;

    final pageBody = SafeArea(
      child: SizedBox(
      height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 1,
      child: Transactions(_transactions, _deleteTransaction)
    ));

    return Platform.isIOS 
    ? CupertinoPageScaffold(
        child: pageBody,
        navigationBar: appBar as ObstructingPreferredSizeWidget,
    )
    : Scaffold(
        appBar: appBar,
        body: pageBody,
        floatingActionButton: Platform.isIOS 
          ? Container() 
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _openCreateTransactionModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
