import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/model/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New hat', amount: 7.00, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly groceries',
        amount: 17.00,
        date: DateTime.now())
  ];
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: const Card(
                      color: Colors.blue, elevation: 5, child: Text('Chart!'))),
              Column(
                children: transactions
                    .map((transaction) => Card(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 2)),
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
                                    transaction.date
                                        .toLocal()
                                        .toIso8601String(),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(20, 20, 20, 100)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )
            ]));
  }
}
