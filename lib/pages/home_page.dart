import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/style.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column (
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0, right: 20.0),
                alignment: Alignment.topRight,
                child: PopupMenuButton(
                  icon: Icon(Icons.more_vert, color: MainStyle.main),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('Add group'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      value: 'logout',
                      child: ListTile(
                        leading: Icon(Icons.anchor),
                        title: Text('Logout'),
                      ),
                    ),
                  ],
                onSelected: (result) {
                  if (result == 'logout') {
                    SharedPreferencesUtil.writeBool("isAuth", false);
                    Navigator.pushNamed(context, '/auth');
                  }
                },
                ),
              )
            ),
            TextButton(
              onPressed: () { 
                SharedPreferencesUtil.writeBool("isAuth", false);
                Navigator.pushNamed(context, '/auth');
              },
              child: Text('Logout'),
            ),
          ],
        )
      )
    );
  }
  
}