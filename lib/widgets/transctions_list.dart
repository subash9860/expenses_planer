import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransctionList extends StatelessWidget {
  // const Transctions({ Key? key }) : super(key: key);
  final List _transctions;
  final Function delTx;
  TransctionList(this._transctions,this.delTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _transctions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transctions has been added, yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: _transctions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text("\$ ${_transctions[index].amount}"),
                        ),
                      ),
                    ),
                    title: Text(
                      _transctions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(_transctions[index].date)),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed:()=> delTx(_transctions[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
