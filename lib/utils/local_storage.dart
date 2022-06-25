import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  storeToken(String token) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(await pref.setString('token', token));
  }
  Future<String?> getToken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String ? token = pref.getString('token');
    return token;
  }
  removeToken(String token) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(await pref.setString('token', token));
  }
}