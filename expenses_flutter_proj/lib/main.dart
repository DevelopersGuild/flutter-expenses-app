import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Data/transaction_data.dart';
import 'package:flutter_expenses_app/Widgets/ChartGraph.dart';
import 'package:flutter_expenses_app/Widgets/NewTransaction.dart';
import 'package:provider/provider.dart';
import 'Widgets/TransactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TransactionData(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Expenses App',
        theme: ThemeData(
            errorColor: Colors.red,
            primarySwatch: Colors.purple,
            accentColor: Colors.yellow,
            textTheme: TextTheme(
              button: TextStyle(color: Colors.white),
              headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return NewTransaction();
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                startNewTransaction(context);
              })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startNewTransaction(context);
        },
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Column(
          children: [
            Container(
              child: ChartGraph(),
              height: (height - Scaffold.of(context).appBarMaxHeight) * 0.25,
            ),
            Container(
              child: TransactionList(),
              height: (height - Scaffold.of(context).appBarMaxHeight) * 0.75,
            ),
          ],
        ),
      ),
    );
  }
}
