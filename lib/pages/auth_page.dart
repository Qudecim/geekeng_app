import 'package:flutter/material.dart';
import 'package:geekeng/backend.dart';

class AuthPage extends StatefulWidget {

  final Function refreshHome;

  const AuthPage({Key? key, required this.refreshHome}) : super(key: key);

  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  bool isErrorAuth = false;

  void _showErrorAuth() {
    setState(() => isErrorAuth = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Backend.signin(_loginController.text, _passwordController.text)
                      .then(
                        (answer) => {
                          if (!answer) {
                            _showErrorAuth()
                          } else {
                            widget.refreshHome()
                          }
                        }
                      );
                  },
                  child: Text('Sign-in'),
                ),
                TextButton(
                  onPressed: () { 
                    //print(isErrorAuth);
                    widget.refreshHome();
                  },
                  child: Text('Sign-up'),
                ),
              ],
            ),
            Visibility(
              child: const Text(
                'Oooops',
                style: TextStyle(color: Colors.red),
              ),
              visible: isErrorAuth,
            ),
          ] 
        )
      )
    );
  }
  
}