import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Data/transaction_data.dart';
import 'package:flutter_expenses_app/Models/Transaction.dart';
import 'package:flutter_expenses_app/Widgets/ChartBar.dart';
import 'package:provider/provider.dart';

class ChartGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Transaction> transactionDataRev =
    Provider.of<TransactionData>(context, listen: true)
        .transactionData
        .reversed
        .toList();
    double totalSpend = 0;
    for (int i = 0; i < 7 && i < transactionDataRev.length; i++) {
      totalSpend += transactionDataRev[i].amount;
    }
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
          elevation: 6,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < 7 && i < transactionDataRev.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ChartBar(
                    title: transactionDataRev[i].title,
                    amount: transactionDataRev[i].amount,
                    amountPctTotal: transactionDataRev[i].amount / totalSpend,
                  ),
                )
            ],
          )),
    );
  }
}