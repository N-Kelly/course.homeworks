import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'Storage.dart';

import 'components/sign_in.dart';
import 'components/sign_up.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      )
  );

  runApp(MyApp());
  Storage();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter user enter system',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
            primaryColor: Color(0xFF1976D2),
            appBarTheme: AppBarTheme(
                color: Color(0xFF1976D2)
            )
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                tabs: [
                  Tab(text: 'Sign In'),
                  Tab(text: 'Sign Up')
                ],
              ),
              title: Text('Flutter user enter system'),
            ),
            body: TabBarView(
              children: [
                SignIn(),
                SignUp()
              ],
            ),
          ),
        )
    );
  }
}

