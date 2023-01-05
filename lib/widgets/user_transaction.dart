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
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "\$ ${transaction.amount.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                transaction.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
              Text(
                DateFormat().add_yMMMMd().format(transaction.date),
                style: const TextStyle(
                    fontSize: 13, color: Color.fromRGBO(20, 20, 20, 100)),
              )
            ],
          )
        ],
      ),
    );
  }
}
