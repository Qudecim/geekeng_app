import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geekeng/shared_preferences_util.dart';


class Backend {

  static signin(String login, String password) async {
    var url = Uri.parse('http://192.168.0.103/api/sign_in');
    var response = await http.post(url, body: {'login': login, 'password': password});
    var data = await jsonDecode(response.body);

    if (!data['success']) {
      return false;
    } else {
      SharedPreferencesUtil.writeBool("isAuth", true);
      SharedPreferencesUtil.writeInt("user_id", data['user_id']);
      SharedPreferencesUtil.writeString("token", data['token']);
      return true;
    }
    
  }

}

class loginAnswer {

  bool success = false;

}