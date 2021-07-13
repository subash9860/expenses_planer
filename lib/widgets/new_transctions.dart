import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransctions extends StatefulWidget {
  // const NewsTransctions({ Key? key }) : super(key: key);

  final Function addtranscations;
  NewTransctions(this.addtranscations);

  @override
  _NewTransctionsState createState() => _NewTransctionsState();
}

class _NewTransctionsState extends State<NewTransctions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _submit() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final titleSubmit = _titleController.text;
    final amountSubmit = double.parse(_amountController.text);
    if (titleSubmit.isEmpty || amountSubmit <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtranscations(titleSubmit, amountSubmit,_selectedDate,);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            // onChanged: (value) => amountChnage = value,
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submit(),
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (_selectedDate == null)
                        ? "No date chosen"
                        : "Chosen Date: ${DateFormat.yMd().format(_selectedDate!)}",
                  ),
                ),
                SizedBox(width: 20),
                TextButton(
                    onPressed: _presentDatePicker, child: Text("Select Date"))
              ],
            ),
          ),
          ElevatedButton(
            child: Text('Add Transctions'),
            onPressed: _submit,
          )
        ],
      ),
    );
  }
}
