import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';


class HomePage extends StatefulWidget {

  final Function refreshHome;
  const HomePage({Key? key, required this.refreshHome}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

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
                widget.refreshHome();
              },
              child: Text('Logout'),
            ),
          ],
        )
      )
    );
  }
  
}