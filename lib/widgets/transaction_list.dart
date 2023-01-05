import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:personal_expense_tracker/widgets/user_transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({required this.userTransactions, super.key});
  final List<Transaction> userTransactions;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: ListView.builder(
          itemBuilder: (buildContext, index) {
            return UserTransaction(transaction: userTransactions[index]);
          },
          itemCount: userTransactions.length),
    );
  }
}
