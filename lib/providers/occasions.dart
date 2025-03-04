import 'package:flutter/material.dart';

import '../util/api_util.dart';

class Occasions with ChangeNotifier {
  List<dynamic> _occasions = [];

  void updateData(data) {
    _occasions = data;
    notifyListeners();
  }

  Future<void> fetchAndSetData(String masjidId) async {
    var data = await APIUtil.getOccasions(masjidId);
    if (data == null) {
      return;
    }
    _occasions = data;
    notifyListeners();
  }

  Future<bool> deleteOccasion(
      String masjidId, String password, String occasionId) async {
    final result = await APIUtil.deleteOccasion(masjidId, password, occasionId);
    if (result == null) {
      return false;
    } else if (result['resultCode'] == 0) {
      _occasions
          .removeWhere((occasion) => occasion['id'].toString() == occasionId);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addOccasion(String masjidId, String password, DateTime date,
      String description) async {
    final result =
        await APIUtil.addOccasion(masjidId, password, date, description);
    if (result == null) {
      return false;
    } else if (result['resultCode'] == 0) {
      _occasions.add({
        'id': result['id'],
        'description': description,
        'date': date.toIso8601String(),
        'masjidId': masjidId
      });
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  List<Map<String, dynamic>> get occasions {
    return [..._occasions];
  }

  int get length {
    return _occasions.length;
  }
}
