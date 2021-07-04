import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransctionList extends StatelessWidget {
  // const Transctions({ Key? key }) : super(key: key);
  final List _transctions;
  TransctionList(this._transctions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._transctions.map((e) => Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        '\$ ${e.amount}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(e.date),
                      )
                    ],
                  ),
                ],
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            )),
      ],
    );
  }
}
