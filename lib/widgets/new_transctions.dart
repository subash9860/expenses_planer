import 'package:flutter/material.dart';

class NewTransctions extends StatelessWidget {
  // const NewsTransctions({ Key? key }) : super(key: key);

  final Function addtranscations;
  NewTransctions(this.addtranscations);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            // onChanged: (value) => amountChnage = value,
            controller: amountController,
          ),
          ElevatedButton(
              onPressed: () {
                addtranscations(
                    titleController.text, double.parse(amountController.text));
                // print('$titlechange , $amountChnage');
                print(titleController.text);
                print(amountController.text);
              },
              child: Text('Add Transctions'))
        ],
      ),
    );
  }
}
