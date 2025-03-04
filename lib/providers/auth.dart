import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  static const KEY_MASJID_ID = 'masjidId';
  static const KEY_PASSWORD = 'password';

  String _masjidId = '1';
  String _password = '';

  Future<bool> fetchAndSetData() async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      var data = prefs.get('data');
      if (data == null) {
        return true;
      }
      data = json.decode(data);
      _masjidId = data[KEY_MASJID_ID] == null ? 1 : data[KEY_MASJID_ID];
      _password = data[KEY_PASSWORD];
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> successfulAuthentication(
      String masjidId, String password) async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'data',
          json.encode({
            KEY_MASJID_ID: masjidId,
            KEY_PASSWORD: password,
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
            KEY_MASJID_ID: _masjidId,
            KEY_PASSWORD: _password,
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
