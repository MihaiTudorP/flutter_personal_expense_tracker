import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final Transaction transaction;
  const UserTransaction({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "\$${transaction.amount.toStringAsFixed(2)}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                transaction.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Theme.of(context).textTheme.titleLarge?.color),
              ),
              Text(
                DateFormat().add_yMMMMd().format(transaction.date),
                style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).textTheme.headline1?.color),
              )
            ],
          )
        ],
      ),
    );
  }
}
