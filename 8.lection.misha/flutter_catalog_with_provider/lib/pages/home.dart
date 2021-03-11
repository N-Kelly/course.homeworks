import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../default_theme.dart';
import '../pages/sign_in.dart';
import '../pages/sign_up.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog with providers',
      theme: getDefaultTheme(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              tabs: [Tab(text: 'Sign In'), Tab(text: 'Sign Up')],
            ),
            title: Text('Catalog with providers'),
            centerTitle: true,
          ),
          body: WillPopScope(
            onWillPop: () async => false,
            child: TabBarView(
              children: [SignIn(context), SignUp(context)],
            ),
          ),
        ),
      ),
    );
  }
}
