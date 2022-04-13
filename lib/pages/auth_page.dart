import 'package:flutter/material.dart';
import 'package:geekeng/backend.dart';
import 'package:geekeng/style.dart';

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
              'GEEKENG',
              style: TextStyle(
                color: MainStyle.main,
                fontSize: 32,
                fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextField(
                controller: _loginController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MainStyle.main),
                  ), 
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  floatingLabelStyle: TextStyle(color: MainStyle.main),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MainStyle.main),
                  ), 
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  floatingLabelStyle: TextStyle(color: MainStyle.main),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MainStyle.main, // background
                  onPrimary: MainStyle.mainText, // foreground
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Do you have an account? ',
                  style: TextStyle(
                    color: MainStyle.mainText
                  )
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