import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
      return Column(
        children: <Widget>[
          Container(
            height: height * 0.025,
            child: FittedBox(
              child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
            ),
          ),
          Container(
            height: height * 0.13,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 1 - spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color:   Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            height: height * 0.025,
            child: FittedBox(
                child: Text(label)),
          ),
        ],
      );
  }

}