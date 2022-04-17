import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/additional/toast.dart';
import 'dart:io';



class Backend {

  static signin(String email, String password) async {
    var data = await _call('sign_in',{'email': email, 'password': password});
    return login(data);
  }

  static signup(String name, String email, String password) async {
    var data = await _call('sign_up',{'name': name, 'email': email, 'password': password});
    return login(data);
  }

  static login(dynamic data) {
    if (data["token"]?.isEmpty ?? true) {
      return false;
    } else {
      SharedPreferencesUtil.writeBool("isAuth", true);
      SharedPreferencesUtil.writeString("name", data['name']);
      SharedPreferencesUtil.writeString("token", data['token']);
      return true;
    }
  }

  static _call(String url, Object value) async {
    var _url = Uri.parse('http://192.168.0.103/api/' + url);

    try {
      var response = await http.post(_url, 
        body: json.encode(value),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      );

      var data = await jsonDecode(response.body);

      return data;

    } on FormatException catch(e) {
      Toast.error('Ошибка сервера');
      return {'success':false};
    }  on SocketException catch (e) {
      Toast.error('Нет соединения с сервером');
      return {'success':false};
    }
  }
}