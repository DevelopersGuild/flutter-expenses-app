import 'package:flutter/material.dart';
import '../Models/Transaction.dart';

class TransactionItem extends StatelessWidget {
  Transaction transaction;
  TransactionItem({this.transaction});

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 10,
          child: ListTile(
            leading: Text(transaction.amount.toString()),
            title: Text(transaction.title),
            subtitle: Text(transaction.date.toString()),
            trailing: FlatButton(child: Text("Delete"), onPressed: () {
              print("delete");
            },),
          ),
        ));
  }
}
