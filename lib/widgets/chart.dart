import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:personal_expense_tracker/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({required this.recentTransactions, super.key});
  final List<Transaction> recentTransactions;

  double get totalAmountPerWeek {
    return recentTransactions.fold(
        0.0, (sum, transaction) => sum + transaction.amount);
  }

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;

      for (var recentTransaction in recentTransactions) {
        if (recentTransaction.date.day == weekDay.day &&
            recentTransaction.date.month == weekDay.month &&
            recentTransaction.date.year == weekDay.year) {
          totalSum += recentTransaction.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
        'percentage': totalSum == 0.0 ? 0.0 : totalSum / totalAmountPerWeek
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions
              .map((amountPerDayItem) => ChartBar(
                    label: amountPerDayItem['day'] as String,
                    spendingAmount: amountPerDayItem['amount'] as double,
                    spendingPercentageOfTotal:
                        amountPerDayItem['percentage'] as double,
                  ))
              .toList(),
        ));
  }
}
