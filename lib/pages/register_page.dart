import 'package:flutter/material.dart';
import 'package:geekeng/backend.dart';
import 'package:geekeng/style.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final TextEditingController _nameController = TextEditingController();
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
              flex: 4,
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
              flex: 10,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                      child: TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: !isErrorAuth?Colors.white:MainStyle.mainError),   
                          ),  
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: !isErrorAuth?MainStyle.main:MainStyle.mainError),
                          ), 
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.white),
                          floatingLabelStyle: const TextStyle(color: MainStyle.main),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                      child: TextField(
                        controller: _loginController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: !isErrorAuth?Colors.white:MainStyle.mainError),   
                          ),  
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: !isErrorAuth?MainStyle.main:MainStyle.mainError),
                          ), 
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          floatingLabelStyle: const TextStyle(color: MainStyle.main),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _passwordController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: !isErrorAuth?Colors.white:MainStyle.mainError),   
                            ),  
                            focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: !isErrorAuth?MainStyle.main:MainStyle.mainError),
                            ), 
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            floatingLabelStyle: const TextStyle(color: MainStyle.main),
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                        ),
                        onPressed: () {
                            Backend.signup(_nameController.text, _loginController.text, _passwordController.text)
                              .then(
                                (answer) => {
                                  if (!answer) {
                                    _showErrorAuth(),
                                    print('aaaauth')
                                  } else {
                                    Navigator.pushNamed(context, '/home')
                                  }
                                }
                              );
                          },
                        child: const Text('Sign-up'),
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
                      //widget.refreshHome();
                      //Toast.error('Нет соединения с сервером');
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign-in',
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