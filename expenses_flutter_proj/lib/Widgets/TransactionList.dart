import 'package:expenses_flutter_proj/Widgets/TransactionItem.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  @required final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transactions added yet!",
                  style: Theme.of(context).textTheme.title,
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
          :
      ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transactions[index],);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
