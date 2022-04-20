import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';
import 'package:geekeng/style.dart';
import 'package:geekeng/backend.dart';


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
                        items.add(Text(item['name']));
                      }
                    }

                    return Column(
                      children: items,
                    );
                  }),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/group');
                },
                onLongPress: () {
                  print("Long press");
                },
                child:Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MainStyle.main,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container (
                        child: const Text(
                          'Main',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: const Text(
                              'Слов: 10',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            ),
                            Container(
                              child: const Text(
                              'Занятий: 5',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
              GestureDetector(
                onTap:() {
                  var d = showDialog(
                    context: context, 
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Reset settings?'),
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
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                  ).then((result){
                    print(result);
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