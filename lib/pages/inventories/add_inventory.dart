import 'package:flutter/material.dart';

import '../../components/stock_form.dart';
import '../../models/inventory.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({Key? key}) : super(key: key);

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Inventory'),
      ),
      body: StockForm(
        inv: Inventory(),
        submit: _submit,
        buttonLabel: 'Submit',
      ),
    );
  }

  _submit(Inventory inv) {
    // print('name: ${inv.description} stock:${inv.stock} price: ${inv.price}');
  }
}