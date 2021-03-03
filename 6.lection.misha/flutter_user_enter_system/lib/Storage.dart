import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'utils/convert_form_controllers.dart';

class Storage {
  static final Storage _singleton = Storage._internal();
  static SharedPreferences _preferences;
  var currentUserData;

  factory Storage() {
    return _singleton;
  }

  void saveUserData(Map<String, TextEditingController> userData) {
    String result = convertFormControllersToString(userData);
    print(result);
    _preferences.setString('userData', result);
  }

  Storage._internal() {
    (() async {
      _preferences = await SharedPreferences.getInstance();
      bool isUserDataExist = _preferences.containsKey('userData');
      currentUserData = (isUserDataExist) ? json.decode(_preferences.getString('userData')) : null;
      print('Current user data from storage => $currentUserData');
    })();
  }
}