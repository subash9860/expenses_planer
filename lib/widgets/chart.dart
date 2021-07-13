import 'package:expenses_planer/widgets/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transctions.dart';

class Chart extends StatelessWidget {
  // const Chart({ Key? key }) : super(key: key);
  final List<Transction> recentTransctions;
  Chart(this.recentTransctions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (int i = 0; i < recentTransctions.length; i++) {
        if (recentTransctions[i].date.day == weekday.day &&
            recentTransctions[i].date.month == weekday.month &&
            recentTransctions[i].date.year == weekday.year) {
          totalSum += recentTransctions[i].amount;
        }
      }
      // print(DateFormat.E().format(weekday));
      // print(totalSum);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + double.parse(item['amount'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      // color: Theme.of(context).accentColor,
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalspending == 0
                      ? 0.0
                      : ((data['amount'] as double) / totalspending)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
