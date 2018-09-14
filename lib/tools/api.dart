import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static String apiUrl = "api.juulsgaard.io";

  static Future apiCall(String method, String call,
      [Object data = const {}]) async {
    http.Response response;

    if (method.toLowerCase() == "post") {
      response = await http.post(
        Uri.http(apiUrl, call),
        body: data,
        headers: getHeaders(),
      );
    } else {
      response = await http.get(
        Uri.http(apiUrl, call, data),
        headers: getHeaders(),
      );
    }

    return json.decode(response.body);
  }

  static Object getHeaders() => {"Auth": ""};
}
