import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Data/transaction_data.dart';
import 'package:flutter_expenses_app/Models/Transaction.dart';
import 'package:provider/provider.dart';
import './ChartBar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionData =
        Provider.of<TransactionData>(context, listen: true)
            .transactionData
            .reversed
            .toList();
    double totalSpend = 0;
    for (int i = 0; i < 7 && i < transactionData.length; i++) {
      totalSpend += transactionData[i].amount;
    }
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          for (int i = 0; i < 7 && i < transactionData.length; i++)
            ChartBar(
              label: transactionData[i].title,
              spendingAmount: transactionData[i].amount,
              spendingPctOfTotal: transactionData[i].amount / totalSpend,
            )
        ]),
      ),
    );
  }
}
