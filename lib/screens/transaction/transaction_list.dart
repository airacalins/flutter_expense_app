import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import '../../widgets/card/transaction_card.dart';

class TransactionsList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
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
        itemBuilder: (ctx, index) =>  TransactionCard(transactions[index]),
        itemCount: transactions.length
      )
    );
  }
}
