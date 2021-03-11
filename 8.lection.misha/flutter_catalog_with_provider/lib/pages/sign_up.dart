import 'package:flutter/material.dart';

import '../storage.dart';
import '../validators/enter_system.validators.dart';
import '../components/input_data.dart';

class SignUp extends StatefulWidget {
  final BuildContext _parentContext;

  SignUp(this._parentContext);

  @override
  _SignUpState createState() => _SignUpState(this._parentContext);
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

  BuildContext parentContext;
  _SignUpState(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 5.0),
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
                height: 55,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      bool isError = false;
                      String result;

                      if(_formControllers['password'].text != _formControllers['rePassword'].text) {
                        isError = true;
                        result = 'Passwords is not match!';
                      } else if(Storage().currentUserData != null) {
                        isError = true;
                        result = 'You already have account!';
                      } else {
                        Storage().saveUserData(_formControllers);
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
                  child: Text('Sign up'),
                  color: Color(0xFFFFED58),
                  textColor: Color(0xFF746722),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
