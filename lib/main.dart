import 'package:flutter/material.dart';

import './widgets/new_transctions.dart';
import './models/transctions.dart';
import './widgets/transctions_list.dart';
import './widgets/chart.dart';

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
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'Opensans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transction> _usertransctions = [
    // Transction('a1', 'Shoes', 150.9, DateTime.now()),
    // Transction('a2', 'Books', 100.0, DateTime.now()),
    // Transction('a3', 'Pen', 25.00, DateTime.now()),
  ];

  List<Transction> get _recentTranstions {
    return _usertransctions
        .where((element) => element.date.isAfter(DateTime.now().subtract(
              Duration(days: 7),
            )))
        .toList();
  }

  void _addNewTransctions(
      String txTitle, double txAmount, DateTime chosendate) {
    final newTx = Transction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      chosendate,
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

  void _deleteTransctions( String _id) {
    setState(() {
      _usertransctions.removeWhere((element) => element.id == _id);
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
              Chart(_recentTranstions),
              // Container(
              //     padding: EdgeInsets.all(10),
              //     child: Card(
              //       elevation: 5,
              //       child: Text('CHART!'),
              //       color: Colors.blue,
              //     )),
              TransctionList(_usertransctions,_deleteTransctions),
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
