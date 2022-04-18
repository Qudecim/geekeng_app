import 'package:flutter/material.dart';
import 'package:geekeng/pages/auth_page.dart';
import 'package:geekeng/pages/group_page.dart';
import 'package:geekeng/pages/home_page.dart';
import 'package:geekeng/style.dart';
import 'package:geekeng/pages/register_page.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyApp createState() => _MyApp();

}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    //SharedPreferencesUtil.writeBool("isAuth", false);

    return MaterialApp(
      title: 'GeekEng',
      theme: ThemeData(
        scaffoldBackgroundColor: MainStyle.background
        //fontFamily: 'Montserrat',
      ),
      initialRoute: '/auth',
      routes: <String, WidgetBuilder>{
        '/auth': (BuildContext context) => AuthPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/home': (BuildContext context) => HomePage(),
        '/group': (BuildContext context) => GroupPage(),
      }
    );
  }

}