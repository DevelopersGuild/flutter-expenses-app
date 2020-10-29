import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Widgets/NewTransaction.dart';
import 'Widgets/TransactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expenses App',
      theme: ThemeData(
          errorColor: Colors.red,
          primarySwatch: Colors.green,
          textTheme: TextTheme(button: TextStyle(color: Colors.white))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startNewTransaction(context);
        },
      ),
      backgroundColor: Colors.white,
      body: TransactionList(),
    );
  }
}
