import 'package:flutter/material.dart';

import '../Storage.dart';
import '../components/default_button.dart';
import '../components/confirm_action_alert.dart';
import '../default_theme.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getDefaultTheme(),
      title: 'Content',
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Storage().toggleUserAuth();
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                },
              ),
            ],
            title: Text('Content', style: TextStyle(color: Color(0xffffffff))),
            centerTitle: true,
          ),
          body: Column(
              children: <Widget>[
                SizedBox(height: 20),
                DefaultButton(
                  title: 'Delete my account',
                  action: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => ConfirmActionAlert(
                          title: 'Are you sure that you want to delete your account?',
                          onActionConfirm: () {
                            Storage().removeUserData();
                            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    );
                  },
                  color: Colors.red
                )
              ],
          ),
        ),
      ),
    );
  }
}
