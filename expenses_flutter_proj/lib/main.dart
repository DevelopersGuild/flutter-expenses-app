import 'package:expenses_flutter_proj/Widgets/TransactionList.dart';
import 'package:expenses_flutter_proj/transaction_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        errorColor: Colors.red,
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
      ),
      title: 'Flutter Expenses App',
      home: Scaffold(
        body: TransactionList(
          transactions: TransactionData.transactionData,
        ),
      ),
    );
  }
}
