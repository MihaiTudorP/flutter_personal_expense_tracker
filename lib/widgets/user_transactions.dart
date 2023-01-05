import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New hat', amount: 7.00, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly groceries',
        amount: 17.00,
        date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: 't${DateTime.now().microsecondsSinceEpoch.toString()}',
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(onAddTransaction: _addNewTransaction),
        TransactionList(
          userTransactions: _userTransactions,
        )
      ],
    );
  }
}
