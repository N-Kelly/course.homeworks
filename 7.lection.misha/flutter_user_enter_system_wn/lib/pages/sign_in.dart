import 'package:flutter/material.dart';

import '../Storage.dart';
import '../default_theme.dart';
import '../validators/enter_system.validators.dart';
import '../components/input_data.dart';
import '../components/alert_error.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _formControllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Sign in',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Sign in',
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Fill the form to sign in',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Email',
                    validateFunction: emailValidator,
                    currentController: _formControllers['email'],
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Password',
                    validateFunction: passwordValidator,
                    isSecure: true,
                    currentController: _formControllers['password'],
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          bool isError = false;
                          String result;

                          if (Storage().currentUserData == null) {
                            isError = true;
                            result = 'You are not sign-up yet!';
                          } else if (Storage().currentUserData['password'] != _formControllers['password'].text) {
                            isError = true;
                            result = 'Invalid password!';
                          }

                          if (isError) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => AlertError(
                                    title: 'Sign in error!',
                                    message: result,
                                ),
                              ),
                            );
                          } else {
                            Storage().toggleUserAuth();
                            Navigator.of(context).pushNamedAndRemoveUntil('/content', (Route<dynamic> route) => false);
                          }
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Color(0xFF2386E8),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
