import 'package:flutter/material.dart';
import 'package:geekeng/style.dart';


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
        child: Column (
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: MainStyle.main,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ),

            Expanded(
              flex: 20,
              child: Container()
            ),

            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: 40.0,
                      height: 36.0,
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: MainStyle.main,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 22,
                          color: MainStyle.mainText,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 36.0,
                      child: Ink(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: ShapeDecoration(
                          color: MainStyle.main,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: TextButton(
                          child: const Text(
                            'Training',
                            style: TextStyle(color: MainStyle.mainText),
                            ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          
          ],
        )
      )
    );
  }
  
}