import 'package:flutter/material.dart';

import '../storage.dart';
import '../default_theme.dart';
import '../validators/enter_system.validators.dart';
import '../components/input_data.dart';
import '../components/alert_error.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _formControllers = {
    "name": TextEditingController(),
    "email": TextEditingController(),
    "phoneNumber": TextEditingController(),
    "password": TextEditingController(),
    "rePassword": TextEditingController()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Sing up',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Sing up',
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
                    'Fill the form to sign up',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Name',
                    validateFunction: nameValidator,
                    currentController: _formControllers['name'],
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Email',
                    validateFunction: emailValidator,
                    currentController: _formControllers['email'],
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Phone number',
                    validateFunction: phoneNumberValidator,
                    currentController: _formControllers['phoneNumber'],
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Password',
                    validateFunction: passwordValidator,
                    isSecure: true,
                    currentController: _formControllers['password'],
                  ),
                  SizedBox(height: 20.0),
                  InputData(
                    hintText: 'Confirm password',
                    validateFunction: passwordValidator,
                    isSecure: true,
                    currentController: _formControllers['rePassword'],
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

                          if (_formControllers['password'].text !=
                              _formControllers['rePassword'].text) {
                            isError = true;
                            result = 'Passwords is not match!';
                          } else if (Storage().currentUserData != null) {
                            isError = true;
                            result = 'You already have account!';
                          } else {
                            Storage().saveUserData(_formControllers);
                          }

                          if (isError) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => AlertError(
                                    title: 'Sign up error!',
                                    message: result
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
                        'Sign up',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Color(0xFF2386E8),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
