import 'package:flutter/material.dart';
import './create_transaction.dart';
import '../../models/transaction.dart';
import '../../widgets/card/transaction_card.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({ Key? key }) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(id: 1, title: 'Transaction 1', amount: 99.99, date: DateTime.now()),
    Transaction(id: 2, title: 'Transaction 2', amount: 29.99, date: DateTime.now()),
    Transaction(id: 3, title: 'Transaction 3', amount: 39.99, date: DateTime.now()),
    Transaction(id: 4, title: 'Transaction 4', amount: 49.99, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateTransaction(),
        Column(
          children: transactions
            .map((t) => TransactionCard(t))
            .toList()
        ),
      ],
    );
  }
}
