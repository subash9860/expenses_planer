import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({ Key? key }) : super(key: key);
//
  final lable;
  final spendingamount;
  final spendingPctOfTotal;
  ChartBar(this.lable, this.spendingamount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.10,
              child: Text('\$${spendingamount.toStringAsFixed(0)}')),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: constraints.maxWidth * 0.35,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.06,
          ),
          Container(
              height: constraints.maxHeight * 0.14,
              child: FittedBox(child: Text(lable)))
        ],
      );
    });
  }
}
