import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Models/Transaction.dart';
import 'package:provider/provider.dart';
import '../Widgets/TransactionItem.dart';
import '../Data/transaction_data.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return TransactionItem(
              transaction: Provider.of<TransactionData>(context, listen: true)
                  .transactionData[index],
            );
          },
          itemCount: Provider.of<TransactionData>(context, listen: true)
              .transactionData
              .length),
    );
  }
}
