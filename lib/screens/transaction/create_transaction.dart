// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTransaction extends StatefulWidget {
  final Function createTransaction;
  CreateTransaction(this.createTransaction);

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.createTransaction(title, amount);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now())
      .then((date) {
        if (date == null) {return;}

        setState(() =>_selectedDate = date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(child: Text(_selectedDate == null ? 'No date chosen!' : "Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}")),
                      TextButton(
                        child: Text(
                          _selectedDate == null ? 'Choose Date' : 'Change Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: _showDatePicker
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    child: Text('Add Transaction'),
                    onPressed: _submitData,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
