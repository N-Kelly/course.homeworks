import 'package:flutter/material.dart';

import '../storage.dart';
import '../default_theme.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Storage().initStorage().then((storage) {
      return new Future.delayed(const Duration(seconds: 2), () {
        if (storage['isUserAuth']) Navigator.of(context).pushNamedAndRemoveUntil('/content', (Route<dynamic> route) => false);
        else Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      });
    });

    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Flutter user enter system [wn]',
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Transform.scale(
                  scale: 2.5,
                  child: CircularProgressIndicator(),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
