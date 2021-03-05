import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function action;
  final Color color;

  DefaultButton({ @required this.title, @required this.action, this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        color: color ?? Color(0xFF2386E8),
        textColor: Colors.white,
        onPressed: action,
      ),
    );
  }
}
