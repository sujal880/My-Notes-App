import 'dart:convert';
import 'dart:io';
import 'package:mynotes_app/domain/constants/appexceptions.dart';
import 'package:mynotes_app/domain/constants/appprefs.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> postapi(
      {required String url,
      Map<String, dynamic>? bodyparams,
      bool isheaderrequired = false}) async {
    final uri = Uri.parse(url);
    String? token;
    if (isheaderrequired) {
      token = await AppPrefs().getprefs();
    }
    try {
      final response =
          await http.post(uri, body: jsonEncode(bodyparams), headers: {
        "Content-Type": "application/json",
        if (isheaderrequired && token != null) "Authorization": "Bearer $token"
      });

      return jsonResponse(response);
    } on SocketException catch (ex) {
      throw FetchDataException(errormsg: ex.toString());
    } catch (ex) {
      throw FetchDataException(errormsg: ex.toString());
    }
  }
}

dynamic jsonResponse(http.Response res) {
  switch (res.statusCode) {
    case 200:
      {
        final dresponse = jsonDecode(res.body);
        return dresponse;
      }
    case 400:
      throw BadRequestException(errormsg: res.body.toString());
    case 401:
    case 500:
    default:
      throw FetchDataException(errormsg: res.body.toString());
  }
}
