import 'package:flutter/material.dart';
import '../Data/transaction_data.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(TransactionData.transactionData[index].title);
        },
        itemCount: TransactionData.transactionData.length,
      ),
    );
  }
}
