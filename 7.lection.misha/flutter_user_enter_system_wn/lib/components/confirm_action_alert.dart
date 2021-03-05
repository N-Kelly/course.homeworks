import 'package:flutter/material.dart';

class ConfirmActionAlert extends StatelessWidget {
  final String title;
  final Function onActionConfirm;
  final Function onActionCancel;

  ConfirmActionAlert({ @required this.title, this.onActionConfirm, this.onActionCancel });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text(title),
        actions: [
          FlatButton(
            onPressed: onActionConfirm ?? () => Navigator.pop(context),
            child: Text('OK'),
          ),
          FlatButton(
            onPressed: onActionCancel ?? () => Navigator.pop(context),
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }
}
