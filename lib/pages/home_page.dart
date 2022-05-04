import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/style.dart';
import 'package:geekeng/backend.dart';
import 'package:geekeng/components/group_button.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final TextEditingController _testController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container (
        margin: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: FutureBuilder<dynamic>(
                  future: Backend.getGroups(), // a previously-obtained Future<String> or null
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                    List<Widget> items = [];
                    if (snapshot.hasData) {
                      for (var item in snapshot.data) {
                        print(item);
                        items.add(GroupButton(group: item));
                      }
                    }

                    return Column(
                      children: items,
                    );
                  }),
              ),
              GestureDetector(
                onTap:() {
                  var d = showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Add words group'),
                        content: Column(
                          children: [
                            Text('Input words group name'),
                            TextField(
                              controller: _testController,
                            )
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: MainStyle.main),
                            ),
                            onPressed: () {
                              Navigator.pop(context, '');
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Accept',
                              style: TextStyle(color: MainStyle.main),
                            ),
                            onPressed: () {
                              Backend.addGroup(_testController.text);
                              Navigator.popAndPushNamed(context, '/home');
                            },
                          ),
                        ],
                      );
                    }
                  ).then((result){
                    print(result);
                    print('lala');
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromARGB(255, 246, 122, 6),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),

                ),
              ),
            ],
          )
        ),
      )
    );
  }
  
}