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
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'GEEKENG',
                  style: TextStyle(
                color: MainStyle.main,
                fontSize: 32,
                fontWeight: FontWeight.w300,
                ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextField(
                        controller: _loginController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: !isErrorAuth?Colors.white:MainStyle.mainError),   
                          ),  
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: !isErrorAuth?MainStyle.main:MainStyle.mainError),
                          ), 
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          floatingLabelStyle: TextStyle(color: MainStyle.main),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: !isErrorAuth?Colors.white:MainStyle.mainError),   
                            ),  
                            focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: !isErrorAuth?MainStyle.main:MainStyle.mainError),
                            ), 
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            floatingLabelStyle: TextStyle(color: MainStyle.main),
                          ),
                        ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
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
                                    _showErrorAuth(),
                                    print('aaaauth')
                                  } else {
                                    widget.refreshHome()
                                  }
                                }
                              );
                          },
                        child: Text('Sign-in'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex:1,
              child: Row(
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
                    child: const Text(
                      'Sign-up',
                      style: TextStyle(
                        color: MainStyle.main
                      )
                      ),
                  ),
                ],
              ),
            )

            // Visibility(
            //   child: const Text(
            //     'Oooops',
            //     style: TextStyle(color: Colors.red),
            //   ),
            //   visible: isErrorAuth,
            // ),
          ] 
        )
      )
    );
  }
  
}