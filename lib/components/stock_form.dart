import 'package:flutter/material.dart';

import '../models/inventory.dart';

class StockForm extends StatefulWidget {
  final String buttonLabel;
  final Function submit;
  Inventory inv;

  StockForm(
      {Key? key,
        required this.buttonLabel,
        required this.submit,
        required this.inv})
      : super(key: key);

  @override
  State<StockForm> createState() => _StockFormState();
}

class _StockFormState extends State<StockForm> {
  @override
  Widget build(BuildContext context) {
    var keyForm = GlobalKey<FormState>();
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                initialValue: widget.inv.description,
                onSaved: (String? value) {
                  widget.inv.description = value!;
                },
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: widget.inv.stock.toString(),
                onSaved: (String? value) {
                  widget.inv.stock = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                validator: _validateNumber,
                decoration: InputDecoration(labelText: 'Stock'),
              ),
            ),
            ListTile(
              title: TextFormField(
                initialValue: widget.inv.price.toString(),
                onSaved: (String? value) {
                  widget.inv.price = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                validator: _validateNumber,
                decoration: InputDecoration(labelText: 'Price'),
              ),
            ),
            ListTile(
                title: ElevatedButton(
                  child: Text(widget.buttonLabel),
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      keyForm.currentState!.save();
                      widget.submit(widget.inv);
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }

  String? _validateString(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill data';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill data';
    }
    if (double.tryParse(value) == null) {
      return 'Invalid number';
    }
    return null;
  }
}