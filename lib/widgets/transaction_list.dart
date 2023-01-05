import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:personal_expense_tracker/widgets/user_transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({required this.userTransactions, super.key});
  final List<Transaction> userTransactions;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (buildContext, index) {
                return UserTransaction(transaction: userTransactions[index]);
              },
              itemCount: userTransactions.length),
    );
  }
}
