import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
        child: Column (
          children: [
            Text(
              "Home page",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
              onPressed: () { 
                SharedPreferencesUtil.writeBool("isAuth", false);
              },
              child: Text('Logout'),
            ),
          ],
        )
      )
    );
  }
  
}