import 'package:flutter/material.dart';
import 'package:gsb_day03/models/inventory.dart';
import 'package:gsb_day03/services/inventory_service.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: InventoryService().getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Inventory?>?> snapshot) {
          if(snapshot.hasData){
            List<Inventory?> inventories = snapshot.data!;
            return ListView.builder(
              itemCount: inventories.length,
                itemBuilder: (BuildContext context, int i){
                Inventory inv = inventories[i]!;
              return ListTile(
                leading: Icon(Icons.ad_units),
                title: Text(inv.description),
                subtitle: Text(inv.createdDate.toString()),
                trailing: Text(inv.stock.toString()),
              );
            });
          }
          return Center(child: CircularProgressIndicator());
    },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
