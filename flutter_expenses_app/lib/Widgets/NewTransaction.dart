import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/Data/transaction_data.dart';
import 'package:flutter_expenses_app/Models/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  void presentDatePicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 1),
        initialDate: selectedDate,
        lastDate: DateTime.now());

    setState(() {
      if (picked != null) {
        selectedDate = picked;
      }
    });
  }

  void submitData(BuildContext context) {
    Provider.of<TransactionData>(context, listen: false).transactionData.add(Transaction(
        title: titleController.text,
        amount: double.parse(amountController.text),
        date: selectedDate,
        id: DateTime.now().toString()));

    Provider.of<TransactionData>(context, listen: false).notifyListeners();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Current Date: ${DateFormat.yMMMd().format(selectedDate)}"),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    presentDatePicker(context);
                  },
                  child: Text(
                    "Choose Date",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    submitData(context);
                  },
                  child: Text(
                    "Submit",
                    style: Theme.of(context).textTheme.button,
                  ),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
