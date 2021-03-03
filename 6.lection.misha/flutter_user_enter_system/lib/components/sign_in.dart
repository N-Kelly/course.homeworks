import 'package:flutter/material.dart';

import '../Storage.dart';
import '../validators/enter_system.validators.dart';
import 'input_data.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _formControllers = {
    "email": new TextEditingController(),
    "password": new TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child:  Column(
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
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            bool isError = false;
                            String result;

                            if(Storage().currentUserData == null) {
                              isError = true;
                              result = 'You are not sign-up yet!';
                            } else if(Storage().currentUserData['password'] != _formControllers['password'].text) {
                              isError = true;
                              result = 'Invalid password!';
                            } else {
                              result = '${Storage().currentUserData['name']}, you successfully sign in!';
                            }

                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(result),
                                backgroundColor: isError ? Colors.red : Colors.green
                            ));
                          }
                        },
                        child: Text('Sign in'),
                        color: Color(0xFF2386E8),
                        textColor: Colors.white,
                    )
                  )
                ],
              )
          )
      ),
    );
  }
}
