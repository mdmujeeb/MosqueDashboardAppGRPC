import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  static const keyMasjidId = 'masjidId';
  static const keyPassword = 'password';

  String _masjidId = '1';
  String _password = '';

  Future<bool> fetchAndSetData() async {
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      dynamic data = prefs.get('data');
      if (data == null) {
        return true;
      }
      data = json.decode(data.toString());
      _masjidId = '${data?[keyMasjidId] ?? '1'}';
      _password = '${data?[keyPassword] ?? ''}';
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> successfulAuthentication(
      String masjidId, String password) async {
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'data',
          json.encode({
            keyMasjidId: masjidId,
            keyPassword: password,
          }));
      _masjidId = masjidId;
      _password = password;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      _password = '';
      await prefs.setString(
          'data',
          json.encode({
            keyMasjidId: _masjidId,
            keyPassword: _password,
          }));
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> chooseMasjid(String masjidId) async {
    return await successfulAuthentication(masjidId, '');
  }

  bool get isLoggedIn {
    return _password.isNotEmpty;
  }

  String get masjidId {
    return _masjidId;
  }

  String get password {
    return _password;
  }
}
