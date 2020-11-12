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
            textTheme: TextTheme(button: TextStyle(color: Colors.white))),
        home: MyHomePage(),
      ),
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
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
      body: Column(
        children: [
          Container(child: ChartGraph(), height: MediaQuery.of(context).size.height * 0.25,),
          Container(child: TransactionList(), height: MediaQuery.of(context).size.height * 0.60,),
        ],
      ),
    );
  }
}