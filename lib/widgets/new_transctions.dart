import 'package:flutter/material.dart';

class NewTransctions extends StatefulWidget {
  // const NewsTransctions({ Key? key }) : super(key: key);

  final Function addtranscations;
  NewTransctions(this.addtranscations);

  @override
  _NewTransctionsState createState() => _NewTransctionsState();
}

class _NewTransctionsState extends State<NewTransctions> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  submit() {
    final titleSubmit = titleController.text;
    final amountSubmit = double.parse(amountController.text);
    if (titleSubmit.isEmpty || amountSubmit <= 0) {
      return;
    }
    widget.addtranscations(titleSubmit, amountSubmit);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            // onChanged: (value) => titlechange = value,
            controller: titleController,
            onSubmitted: (_) => submit(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            // onChanged: (value) => amountChnage = value,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submit(),
          ),
          ElevatedButton(
            child: Text('Add Transctions'),
            onPressed: submit,
          )
          // () {
          //   addtranscations(
          //       titleController.text, double.parse(amountController.text));
          // print('$titlechange , $amountChnage');
          // print(titleController.text);
          // print(amountController.text);
          // },
        ],
      ),
    );
  }
}
