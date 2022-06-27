import 'package:flutter/material.dart';
import 'package:gsb_day03/components/stock_form.dart';
import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:gsb_day03/models/inventory.dart';
import 'package:gsb_day03/services/inventory_service.dart';
import 'package:gsb_day03/utils/alert_helper.dart';
import 'package:gsb_day03/utils/loading_progress.dart';

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
          TextButton(
              onPressed: () {
                _delete(inv.id!);
              },
              child: Text('remove'))
        ],
      ),
    );
  }
  _submit(Inventory inv) {
    LoadingProgress.inProgress(() async{
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg htm = await inventoryService.update(inv);
      if(htm.success){
        AlertHelper.showBar(context: context, msg: 'update complete');
        Navigator.pop(context);
      }else{
        AlertHelper.showBar(context: context, msg: htm.err!, isError: true);
      }
    });
  }

  _delete(int id) async{
    AlertHelper.alertPopup(
        context: context,
        title: 'Delete',
        desc: 'Are you sure want to delete',
        function: () {
          LoadingProgress.inProgress(() async{
            InventoryService inventoryService = InventoryService();
            HttpStatusMsg htm = await inventoryService.delete(id);
            if (htm.success) {
              AlertHelper.showBar(context: context, msg: 'Delete complete');
              Navigator.pop(context);
            } else {
              AlertHelper.showBar(context: context, msg: htm.err!, isError: true);
            }
          });
        }
    );
  }
}
