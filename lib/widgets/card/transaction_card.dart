// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7.5),
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("₱", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                  Text("${transaction.amount.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.title, style: TextStyle(fontSize: 15)),
                  Text(DateFormat.yMMMd().format(transaction.date) ,style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
