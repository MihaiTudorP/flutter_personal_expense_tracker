import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/widgets/chart.dart';
import 'package:personal_expense_tracker/widgets/new_transaction.dart';
import 'package:personal_expense_tracker/widgets/user_transactions.dart';

import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal expenses',
        home: const MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                titleMedium: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                titleSmall: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(onAddTransaction: _addNewTransaction));
        });
  }

  List<Transaction> get getRecentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(getOldestDateTruncated);
    }).toList();
  }

  DateTime get getOldestDateTruncated {
    final oldestDate = DateTime.now().subtract(const Duration(days: 7));
    final truncatedOldestDate =
        DateTime(oldestDate.year, oldestDate.month, oldestDate.day);
    return truncatedOldestDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal expenses'), actions: <Widget>[
        IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: const Icon(Icons.add))
      ]),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                  width: double.infinity,
                  child: Card(
                      color: Theme.of(context).cardColor,
                      elevation: 5,
                      child: Chart(recentTransactions: getRecentTransactions))),
              UserTransactions(
                userTransactions: _userTransactions,
              ),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        backgroundColor: Theme.of(context).splashColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
