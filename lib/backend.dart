import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geekeng/shared_preferences_util.dart';

import 'dart:io';



class Backend {

  static signin(String email, String password) async {
    var url = Uri.parse('http://192.168.0.103/api/sign_in');

    //var response1 = await http.get(Uri.parse('http://192.168.0.103/sanctum/csrf-cookie'));

    var response = await http.post(url, 
      body: json.encode({'email': email, 'password': password}),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    );

    var data = await jsonDecode(response.body);


    // Map jsonMap = {'email': email, 'password': password};

    // HttpClient httpClient = new HttpClient();
    // HttpClientRequest request = await httpClient.postUrl(Uri.parse('http://192.168.0.103/api/sign_in'));
    // request.followRedirects = true;
    // request.headers.set('content-type', 'application/json');
    // request.headers.set('Accept', 'application/json');
    // //Accept: application/json
    // request.add(utf8.encode(json.encode(jsonMap)));
    // HttpClientResponse response = await request.close();
    // // todo - you should check the response.statusCode
    // String reply = await response.transform(utf8.decoder).join();
    // print(reply);
    // httpClient.close();
    // return false;


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