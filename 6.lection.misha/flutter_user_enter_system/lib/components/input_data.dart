import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  final String hintText;
  final Function validateFunction;
  final bool isSecure;
  final TextEditingController currentController;

  InputData({ this.hintText, this.validateFunction, this.isSecure, this.currentController });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
        ),
        validator: validateFunction,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: isSecure ?? false,
        controller: currentController,
    );
  }
}
