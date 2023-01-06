import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPercentageOfTotal,
      super.key});
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 1.0),
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercentageOfTotal,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor)),
            )
          ]),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ]),
    );
  }
}
