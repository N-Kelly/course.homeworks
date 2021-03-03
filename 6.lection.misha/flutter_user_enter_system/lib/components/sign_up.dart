import 'package:flutter/material.dart';

import '../Storage.dart';
import '../validators/enter_system.validators.dart';
import 'input_data.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _formControllers = {
    "name": new TextEditingController(),
    "email": new TextEditingController(),
    "phoneNumber": new TextEditingController(),
    "password": new TextEditingController(),
    "rePassword": new TextEditingController()
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        result = 'Your account was created :)';
                      }

                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(result),
                        backgroundColor: isError ? Colors.red : Colors.green
                      ));
                    }
                  },
                  child: Text('Sign up'),
                  color: Color(0xFF2386E8),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
