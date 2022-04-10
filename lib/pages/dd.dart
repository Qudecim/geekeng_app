import 'package:flutter/material.dart';
import 'package:geekeng/shared_preferences_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'geekeng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'geekeng'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _savedValue = "加载中..";

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtil.readString("myData").then((value) {
      setState(() {
        _savedValue = value ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _savedValue,
              style: Theme.of(context).textTheme.headline4,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Text("Hello"),
                  onPressed: () {
                    SharedPreferencesUtil.writeString(
                        "myData", 'dd');

                    setState(() {
                      _savedValue = 'dd';
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
