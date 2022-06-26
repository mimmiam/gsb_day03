import 'package:flutter/material.dart';
import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:gsb_day03/services/inventory_service.dart';
import 'package:gsb_day03/utils/alert_helper.dart';
import 'package:gsb_day03/utils/loading_progress.dart';

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
    LoadingProgress.inProgress(() async{
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg htm = await inventoryService.insert(inv);
      if(htm.success){
        AlertHelper.showBar(context: context, msg: 'Insert Complete');
        Navigator.pop(context);
      }else{
        AlertHelper.showBar(context: context, msg: htm.err!, isError: true);
      }
    });
  }
}