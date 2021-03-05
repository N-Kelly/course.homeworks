import 'dart:convert';
import 'package:flutter/material.dart';

String convertFormControllersToString(Map<String, TextEditingController> formControllers) {
  Map formValues = {};
  formControllers.forEach((k, v) { if(k != 'rePassword') formValues[k] = v.text; });
  return json.encode(formValues);
}