import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransctionList extends StatelessWidget {
  // const Transctions({ Key? key }) : super(key: key);
  final List _transctions;
  TransctionList(this._transctions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      child: ListView.builder(
        itemCount: _transctions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text(
                      '\$ ${_transctions[index].amount}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _transctions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(_transctions[index].date),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
