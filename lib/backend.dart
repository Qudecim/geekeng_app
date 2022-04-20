import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/additional/toast.dart';
import 'dart:io';



class Backend {

  static const POST = 'post';
  static const GET = 'get';

  static signin(String email, String password) async {
    var data = await _call('sign_in', value: {'email': email, 'password': password}, type: POST);
    return login(data);
  }

  static signup(String name, String email, String password) async {
    var data = await _call('sign_up', value: {'name': name, 'email': email, 'password': password}, type: POST);
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

  static getGroups() async {
    var d = await _call('group');
    print(d);
    return d;
  }

  static getGroup(String id) async {
    return await _call('group/' + id);
  }

  static _call(String url, {Object? value, String type = GET}) async {
    var _url = Uri.parse('http://192.168.0.103/api/' + url);

    try {
      var headers = {
          "Content-Type": "application/json",
          "Accept": "application/json"
        };

      if (await SharedPreferencesUtil.readBool('isAuth')) {
        var token = await SharedPreferencesUtil.readString('token');
        headers['Authorization'] = "Bearer " + token;
      }

      http.Response response;
      if (type == POST) {
        response = await http.post(_url, body: json.encode(value), headers: headers);
      } else {
        response = await http.get(_url,  headers: headers);
      }

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