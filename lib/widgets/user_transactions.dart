import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatelessWidget {
  final List<Transaction> userTransactions;
  const UserTransactions({required this.userTransactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(
          userTransactions: userTransactions,
        )
      ],
    );
  }
}
