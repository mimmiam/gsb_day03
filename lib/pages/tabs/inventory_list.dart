import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                var f = NumberFormat("#,##0.00");
                var d = DateFormat.yMMMEd();
                String price = f.format(inv.price);
                String updateDate = d.format(inv.updatedDate!);
              return ListTile(
                leading: Icon(Icons.ad_units),
                title: Text(inv.description),
                subtitle: Text(updateDate),
                trailing: Text('$price Bath'),
                onTap: () {
                  Navigator.pushNamed(context,
                      '/update',
                      arguments: inv
                  ).then((value) => setState(() {}));
                },
              );
            });
          }
          return Center(child: CircularProgressIndicator());
    },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add').then(
                  (value) => setState(() {})
          );
        },
      ),
    );
  }
}
