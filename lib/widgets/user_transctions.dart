import 'package:flutter/material.dart';

import '../models/transctions.dart';
import './new_transctions.dart';
import './transctions_list.dart';

class UserTransctions extends StatefulWidget {
  const UserTransctions({Key? key}) : super(key: key);

  @override
  _UserTransctionsState createState() => _UserTransctionsState();
}

class _UserTransctionsState extends State<UserTransctions> {
  final List<Transction> _usertransctions = [
    Transction('a1', 'Shoes', 150.9, DateTime.now()),
    Transction('a2', 'Books', 100.0, DateTime.now()),
    Transction('a3', 'Pen', 25.00, DateTime.now()),
  ];

  void _addNewTransctions(String txTitle, double txAmount) {
    final newTx = Transction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      DateTime.now(),
    );

    setState(() {
      _usertransctions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransctions(_addNewTransctions),
        TransctionList(_usertransctions),
      ],
    );
  }
}
