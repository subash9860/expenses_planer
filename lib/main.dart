import 'package:flutter/material.dart';

import './widgets/new_transctions.dart';
import './models/transctions.dart';
import './widgets/transctions_list.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand'
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void _startAddNewTransction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransctions(_addNewTransctions));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Expenses Planer'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: 1000,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Text('CHART!'),
                    color: Colors.blue,
                  )),
              TransctionList(_usertransctions),
              FloatingActionButton(
                onPressed: () => _startAddNewTransction(context),
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
