import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import '../../widgets/card/transaction_card.dart';

class TransactionsList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemBuilder: (ctx, index) =>  TransactionCard(transactions[index]),
        itemCount: transactions.length
      )
    );
  }
}
