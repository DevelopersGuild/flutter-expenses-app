import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Models/Transaction.dart';
import 'package:provider/provider.dart';
import '../Widgets/TransactionItem.dart';
import '../Data/transaction_data.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transactionData =
        Provider.of<TransactionData>(context, listen: true).transactionData;
    return Container(
      child: transactionData.isEmpty
          ? Column(
              children: [
                Text("No Transactions Added Yet!", style: Theme.of(context).textTheme.headline1,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      )),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  transaction: transactionData[index],
                );
              },
              itemCount: transactionData.length),
    );
  }
}
