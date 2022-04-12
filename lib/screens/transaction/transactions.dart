// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import '../../widgets/card/transaction_card.dart';

class Transactions extends StatelessWidget {
  List<Transaction> transactions;
  final Function deleteTransaction;

  Transactions(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: transactions.isEmpty ? 
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text('No transactions added yet!', style: Theme.of(context).textTheme.titleSmall),
            ),
            Container(
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
              height: 200,
            )
          ],
        )
        :
        ListView.builder(
        itemBuilder: (ctx, index) =>  TransactionCard(transactions[index], deleteTransaction),
        itemCount: transactions.length
      )
    );
  }
}
