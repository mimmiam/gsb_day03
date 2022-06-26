import 'dart:convert';

import 'package:gsb_day03/models/http_status_msg.dart';
import 'package:gsb_day03/models/inventory.dart';
import 'package:gsb_day03/utils/local_storage.dart';
import 'package:http/http.dart'as http;

import '../constant.dart';

class InventoryService{
  LocalStorage localStorage = LocalStorage();

  Future<List<Inventory?>?> getAll() async{
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    if(token == null){
      return null;
    }
    final res = await http.get(uri, headers: {
      'Authorization' : 'Bearer $token'
    });

    if(res.statusCode == 200){
      final List result = jsonDecode(res.body);
      List<Inventory> inv = result.map((i) => Inventory.fromJson(i)).toList();
      return inv;
    }
    return null;
  }
}