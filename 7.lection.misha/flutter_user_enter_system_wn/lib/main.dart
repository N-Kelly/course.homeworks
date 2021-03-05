import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'pages/home.dart';
import 'pages/sign_in.dart';
import 'pages/sign_up.dart';
import 'pages/content.dart';
import 'pages/spalsh.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
  );

  runApp(MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => Splash(),
        '/': (_) => Homepage(),
        '/sign-in': (_) => SignIn(),
        '/sign-up': (_) => SignUp(),
        '/content': (_) => Content()
      }
  ));
}

