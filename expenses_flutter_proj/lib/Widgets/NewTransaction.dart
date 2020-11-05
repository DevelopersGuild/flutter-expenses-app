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

  @override
  Widget build(BuildContext context) {
    void submitData() {
      Provider.of<TransactionData>(context, listen: false).transactionData.add(Transaction(
          title: titleController.text,
          date: selectedDate,
          amount: double.parse(amountController.text), id: DateTime.now().toString()),);
      Provider.of<TransactionData>(context, listen: false).notifyListeners();

      Navigator.of(context).pop();
    }

    void presentDatePicker() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime.now());

      if (picked != null)
        setState(() {
          selectedDate = picked;
        });
    }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "No Date Chosen"
                          : "Picked Date: ${DateFormat.yMMMd().format(selectedDate)}",
                    ),
                  ),
                  FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text("Choose Date"),
                    onPressed: () {
                      presentDatePicker();
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Add Transactiomion",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      submitData();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
