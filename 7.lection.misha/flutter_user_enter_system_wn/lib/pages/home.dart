import 'package:flutter/material.dart';

import '../components/default_button.dart';
import '../default_theme.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Flutter user enter system [wn]',
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter user enter system [wn]',
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 20),
              DefaultButton(
                title: 'Sign in',
                action: () => Navigator.pushNamed(context, '/sign-in'),
              ),
              SizedBox(height: 20),
              DefaultButton(
                title: 'Sign up',
                action: () => Navigator.pushNamed(context, '/sign-up'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}