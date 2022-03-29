import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amounController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amounController,
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.blueGrey,
                onPressed: () {
                  // Transaction(title: titleInput, amount: amountInput)
                  print(titleController.text);
                  print(amounController.text);
                },
              )
            ]),
      ),
    );
  }
}
