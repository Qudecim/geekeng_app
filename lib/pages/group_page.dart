import 'package:flutter/material.dart';


class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  _GroupPage createState() => _GroupPage();
}

class _GroupPage extends State<GroupPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container (
        margin: const EdgeInsets.only(top: 25),
        child: TextButton(
          child: Text('back'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      )
    );
  }
  
}