import 'package:flutter/material.dart';
import 'package:gsb_day03/components/stock_form.dart';
import 'package:gsb_day03/models/inventory.dart';

class UpdateInventory extends StatefulWidget {
  const UpdateInventory({Key? key}) : super(key: key);

  @override
  State<UpdateInventory> createState() => _UpdateInventoryState();
}

class _UpdateInventoryState extends State<UpdateInventory> {
  @override
  Widget build(BuildContext context) {
    Inventory inv = ModalRoute.of(context)!.settings.arguments as Inventory;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Inventory'),
      ),
      body: Column(
        children: [
          StockForm(
              buttonLabel: 'update',
              submit: _submit,
              inv: inv
          ),
          TextButton(onPressed: () {}, child: Text('remove'))
        ],
      ),
    );
  }
  _submit(Inventory inv) {

  }
}
