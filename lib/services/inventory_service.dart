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

  Future<HttpStatusMsg> insert(Inventory inventory) async{
    Uri uri = Uri.parse('$HOST/inventory/');
    String? token = await localStorage.getToken();
    HttpStatusMsg htm = HttpStatusMsg();
    if(token == null){
      htm.success = false;
      htm.err = 'Token is null';
      return htm;
    }
    final res = await http.post(
      uri,
      headers: {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: jsonEncode({
        "description" : inventory.description,
        "price": inventory.price,
        "stock": inventory.stock
      }
      )
    );
    // HttpStatusMsg htm = HttpStatusMsg();
    if(res.statusCode == 200){
      htm.success = true;
      return htm;
    }
    htm.success = false;
    htm.err = 'Something went wrong';
    return htm;
  }

  Future<HttpStatusMsg> update(Inventory inventory) async{
    Uri uri = Uri.parse('$HOST/inventory/${inventory.id}');
    String? token = await localStorage.getToken();
    HttpStatusMsg htm = HttpStatusMsg();
    if(token == null){
      htm.success = false;
      htm.err = 'Token is null';
      return htm;
    }
    final res = await http.put(
        uri,
        headers: {
          'Content-Type' : 'application/json',
          'Authorization' : 'Bearer $token'
        },
        body: jsonEncode({
          "description" : inventory.description,
          "price": inventory.price,
          "stock": inventory.stock
        }
        )
    );
    // HttpStatusMsg htm = HttpStatusMsg();
    if(res.statusCode == 200){
      htm.success = true;
      return htm;
    }
    htm.success = false;
    htm.err = 'Something went wrong';
    return htm;
  }

  Future<HttpStatusMsg> delete(int id) async {
    Uri uri = Uri.parse('$HOST/inventory/$id');
    String? token = await localStorage.getToken();
    HttpStatusMsg htm = HttpStatusMsg();
    if (token == null) {
      htm.success = false;
      htm.err = "Token is null";
      return htm;
    }
    final response = await http.delete(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      htm.success = true;
      return htm;
    }
    htm.success = false;
    htm.err = "Something went wrong status code:${response.statusCode}";
    return htm;
  }
}