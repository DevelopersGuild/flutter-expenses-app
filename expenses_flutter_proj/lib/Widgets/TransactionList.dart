import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              // Column()
              children: <Widget>[
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/image/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
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
