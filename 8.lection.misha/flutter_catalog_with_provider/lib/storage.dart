import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'utils/convert_form_controllers.dart';

class Storage {
  static final Storage _singleton = Storage._internal();
  static SharedPreferences _preferences;
  var currentUserData;
  bool isUserAuth = false;

  factory Storage() {
    return _singleton;
  }

  void toggleUserAuth() {
    isUserAuth = !isUserAuth;
    _preferences.setBool('isUserAuth', isUserAuth);
  }

  void removeUserData() {
    _preferences.remove('userData');
    _preferences.remove('isUserAuth');
    currentUserData = null;
    isUserAuth = false;
  }

  void saveUserData(Map<String, TextEditingController> userData) {
    String result = convertFormControllersToString(userData);
    _preferences.setString('userData', result);
    currentUserData = userData;
  }

  Future<Map> initStorage() async {
    _preferences = await SharedPreferences.getInstance();
    bool isUserDataExists = _preferences.containsKey('userData');
    bool isUserAuthExists = _preferences.containsKey('isUserAuth');
    currentUserData = isUserDataExists ? json.decode(_preferences.getString('userData')) : null;
    isUserAuth = isUserAuthExists ? _preferences.getBool('isUserAuth') : false;
    return {
      'currentUserData': currentUserData,
      'isUserAuth': isUserAuth
    };
  }

  Storage._internal();
}