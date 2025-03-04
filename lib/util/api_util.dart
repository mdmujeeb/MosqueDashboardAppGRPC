import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class APIUtil {
  static const API_BASE_URL = '192.168.0.1:8080'; //http://192.168.0.1:8080/api/
  static const LOCAL_API_BASE_URL = '192.168.0.1';

  static const ENDPOINT_GET_DATA_FOR_MOBILE_APP = '/api/getDataForMobileApp';
  static const ENDPOINT_GET_OCCASIONS = '/api/getOccasions';
  static const ENDPOINT_GET_HIJRI_DATE = '/api/getHijriDate';
  static const ENDPOINT_SET_TIME = '/settime.php';
  static const ENDPOINT_AUTHENTICATE = '/api/authenticate';
  static const ENDPOINT_UPDATE_NAMAZ_TIME = '/api/updateNamazTime';
  static const ENDPOINT_DELETE_OCCASION = '/api/deleteOccasion';
  static const ENDPOINT_ADD_OCCASION = '/api/addOccasion';

  static Future<Map<String, dynamic>> getDataForMobileApp(
      String masjidId) async {
    try {
      final response = await http.get(Uri.http(
          API_BASE_URL, ENDPOINT_GET_DATA_FOR_MOBILE_APP, {'id': masjidId}));
      return json.decode(response.body);
    } catch (error) {
      print(error);
      return {};
    }
  }

  static Future<dynamic> getHijriDate(String masjidId) async {
    try {
      final response = await http.get(
          Uri.http(API_BASE_URL, ENDPOINT_GET_HIJRI_DATE, {'id': masjidId}));
      return json.decode(response.body);
    } catch (error) {
      return null;
    }
  }

  static Future<List<dynamic>> getOccasions(String masjidId) async {
    try {
      final response = await http.get(
          Uri.http(API_BASE_URL, ENDPOINT_GET_OCCASIONS, {'id': masjidId}));
      return json.decode(response.body);
    } catch (error) {
      return [];
    }
  }

  static Future<dynamic> setTime() async {
    DateFormat formatter = DateFormat('dd MMM yyyy H:m:00');
    String strTime = formatter.format(DateTime.now());
    // print(strTime);
    try {
      final response = await http.get(
          Uri.http(LOCAL_API_BASE_URL, ENDPOINT_SET_TIME, {'time': strTime}));
      return json.decode(response.body);
    } catch (error) {
      return null;
    }
  }

  static Future<http.Response> sendPostRequest(
      Uri uri, Map<String, dynamic> body) {
    return http.post(
      uri,
      body: json.encode(body),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
  }

  static Future<Map<String, dynamic>> authenticate(
      String masjidId, String password) async {
    try {
      final response =
          await sendPostRequest(Uri.http(API_BASE_URL, ENDPOINT_AUTHENTICATE), {
        'userId': masjidId,
        'password': password,
      });
      return json.decode(response.body);
    } catch (error) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> updateNamazTime(
      String masjidId, String password, String name, String time) async {
    try {
      final response = await sendPostRequest(
        Uri.http(API_BASE_URL, ENDPOINT_UPDATE_NAMAZ_TIME),
        {
          'userId': masjidId,
          'password': password,
          'name': name,
          'time': time,
        },
      );
      return json.decode(response.body);
    } catch (error) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> deleteOccasion(
      String masjidId, String password, String occasionId) async {
    try {
      final response = await sendPostRequest(
        Uri.http(API_BASE_URL, ENDPOINT_DELETE_OCCASION),
        {
          'userId': masjidId,
          'password': password,
          'id': occasionId,
        },
      );
      return json.decode(response.body);
    } catch (error) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> addOccasion(String masjidId,
      String password, DateTime date, String description) async {
    try {
      final response = await sendPostRequest(
        Uri.http(API_BASE_URL, ENDPOINT_ADD_OCCASION),
        {
          'userId': masjidId,
          'password': password,
          'date': DateFormat('yyyy-MM-dd').format(date),
          'description': description,
        },
      );
      return json.decode(response.body);
    } catch (error) {
      return {};
    }
  }
}
