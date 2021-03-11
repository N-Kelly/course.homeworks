import 'package:flutter/material.dart';

import '../storage.dart';
import '../validators/enter_system.validators.dart';
import '../components/input_data.dart';

class SignIn extends StatefulWidget {
  final BuildContext _parentContext;

  SignIn(this._parentContext);

  @override
  _SignInState createState() => _SignInState(this._parentContext);
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _formControllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
  };

  BuildContext parentContext;
  _SignInState(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child:  Column(
                children: <Widget>[
                  SizedBox(height: 5.0),
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
                      height: 55,
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
                            }

                            if(isError) {
                              Scaffold.of(context).hideCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(result),
                                  backgroundColor: Colors.red
                              ));
                            } else {
                              Storage().toggleUserAuth();
                              Navigator.of(parentContext).pushNamedAndRemoveUntil('/content', (Route<dynamic> route) => false);
                            }
                          }
                        },
                        child: Text('Sign in'),
                        color: Color(0xFFFFED58),
                        textColor: Color(0xFF746722),
                    )
                  )
                ],
              )
          )
      ),
    );
  }
}
