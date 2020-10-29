import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  Transaction transaction;
  TransactionItem({this.transaction});

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(transaction.amount.toString()),
                ),
              ),
            ),
            title: Text(transaction.title),
            subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
            trailing: FlatButton(
              color: Theme.of(context).errorColor,
              child: Text("Delete", style: Theme.of(context).textTheme.button,),
              onPressed: () {
                print("delete");
              },
            ),
          ),
        ));
  }
}
