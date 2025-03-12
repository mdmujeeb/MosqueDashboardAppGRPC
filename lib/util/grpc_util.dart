import 'dart:io';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:mosque_dashboard_local/grpc/mosque-dashboard.pbgrpc.dart';

class GRPCUtil {
  // static const host = '192.168.42.1';
  static const host = '192.168.31.84';
  static const port = 8090;

  // ignore: prefer_typing_uninitialized_variables
  static var clientStub;

  GRPCUtil() {
    final channel = ClientChannel(host,
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    clientStub = MosqueDashboardServiceClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
  }

  Future<GetDataForMobileAppRequest> getDataForMobileApp() async {
    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .getDataForMobileApp(EmptyRequest.getDefault());
      return response;
    } catch (error) {
      print(error);
      return GetDataForMobileAppRequest.getDefault();
    }
  }

  // static Future<dynamic> getHijriDate(String masjidId) async {
  //   try {
  //     final response = await http.get(
  //         Uri.http(API_BASE_URL, ENDPOINT_GET_HIJRI_DATE, {'id': masjidId}));
  //     return json.decode(response.body);
  //   } catch (error) {
  //     return null;
  //   }
  // }

  // static Future<List<dynamic>> getOccasions(String masjidId) async {
  //   try {
  //     final response = await http.get(
  //         Uri.http(API_BASE_URL, ENDPOINT_GET_OCCASIONS, {'id': masjidId}));
  //     return json.decode(response.body);
  //   } catch (error) {
  //     return [];
  //   }
  // }

  Future<GenericReply> updateNamazTime(String userName, String password,
      String name, int hour, int minute) async {
    NamazTime namazTime = NamazTime.create();
    namazTime.authData = getAuthData(userName, password);
    namazTime.namazTimeName = name;
    namazTime.hour = hour;
    namazTime.minute = minute;

    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .updateNamazTime(namazTime);
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  Future<GenericReply> updateHijriAdjustment(
      String userName, String password, int adjustment) async {
    HijriAdjustmentUpdateRequest request =
        HijriAdjustmentUpdateRequest.create();
    request.authData = getAuthData(userName, password);
    request.hijriAdjustment = adjustment;

    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .changeHijriAdjustment(request);
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  Future<GenericReply> changeScreenSaverState(
      String userName, String password, bool state) async {
    ScreenSaverStateUpdateRequest request =
        ScreenSaverStateUpdateRequest.create();
    request.authData = getAuthData(userName, password);
    request.isOn = state;

    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .changeScreenSaverState(request);
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  Future<GenericReply> testAudio() async {
    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .testAudio(EmptyRequest.getDefault());
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  Future<GenericReply> restartSystem() async {
    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .restartSystem(EmptyRequest.getDefault());
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  Future<GenericReply> setTime(String userName, String password) async {
    DateFormat formatter = DateFormat('dd MMM yyyy H:m:00');
    String strTime = formatter.format(DateTime.now());
    StringContainer container = StringContainer.create();
    container.str = strTime;
    container.authData = getAuthData(userName, password);

    // print(strTime);
    try {
      final response = await (clientStub as MosqueDashboardServiceClient)
          .setDateTime(container);
      return response;
    } catch (error) {
      return GenericReply.getDefault();
    }
  }

  // static Future<Map<String, dynamic>> deleteOccasion(
  //     String masjidId, String password, String occasionId) async {
  //   try {
  //     final response = await sendPostRequest(
  //       Uri.http(API_BASE_URL, ENDPOINT_DELETE_OCCASION),
  //       {
  //         'userId': masjidId,
  //         'password': password,
  //         'id': occasionId,
  //       },
  //     );
  //     return json.decode(response.body);
  //   } catch (error) {
  //     return {};
  //   }
  // }

  // static Future<Map<String, dynamic>> addOccasion(String masjidId,
  //     String password, DateTime date, String description) async {
  //   try {
  //     final response = await sendPostRequest(
  //       Uri.http(API_BASE_URL, ENDPOINT_ADD_OCCASION),
  //       {
  //         'userId': masjidId,
  //         'password': password,
  //         'date': DateFormat('yyyy-MM-dd').format(date),
  //         'description': description,
  //       },
  //     );
  //     return json.decode(response.body);
  //   } catch (error) {
  //     return {};
  //   }
  // }

  AuthData getAuthData(String userName, String password) {
    AuthData auth = AuthData.create();
    auth.userName = userName;
    auth.password = password;
    return auth;
  }
}

void main(List<String> arguments) async {
  // var data = await GRPCUtil().getDataForMobileApp();
  var data = await GRPCUtil().updateNamazTime('1', 'Allah', 'FAJR', 5, 30);
  print(data);
  exit(0);
}
