import 'package:flutter/material.dart';
import 'package:geekeng/pages/auth_page.dart';
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/pages/home_page.dart';
import 'package:geekeng/style.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyApp createState() => _MyApp();

}

class _MyApp extends State<MyApp> {

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    //SharedPreferencesUtil.writeBool("isAuth", false);

    return MaterialApp(
      title: 'GeekEng',
      theme: ThemeData(
        scaffoldBackgroundColor: MainStyle.background
        //fontFamily: 'Montserrat',
      ),
      home: FutureBuilder<dynamic>(
        future: SharedPreferencesUtil.readBool('isAuth'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data ?? false) {
            return HomePage(refreshHome:refresh);
          } else {
            return AuthPage(refreshHome:refresh);
          }
        },
      ),
    );
  }

}