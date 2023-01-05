import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController amountController = TextEditingController();
  final Function onAddTransaction;
  const NewTransaction({required this.onAddTransaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitNewTransactionForm(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitNewTransactionForm(),
              ),
              TextButton(
                onPressed: submitNewTransactionForm,
                child: const Text('Add transaction',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              )
            ]),
      ),
    );
  }

  void submitNewTransactionForm() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    onAddTransaction(enteredTitle, double.tryParse(enteredAmount));
  }
}
