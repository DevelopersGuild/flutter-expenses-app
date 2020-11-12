import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  String title;
  double amount;
  double amountPctTotal;

  ChartBar({this.title, this.amount, this.amountPctTotal});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(title),
        Container(
          height: height * 0.15,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 - amountPctTotal,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
        Text(amount.toStringAsFixed(0)),
      ],
    );
  }
}
