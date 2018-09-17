import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
	static String apiUrl = "api.juulsgaard.io";
	static String accessToken;
	
	static Future<String> getToken() async {
		if (accessToken == null) {
			SharedPreferences prefs = await SharedPreferences.getInstance();
			accessToken = prefs.getString("accessToken") ?? "";
		}
		return accessToken;
	}
	
	static Future apiCall(String method, String call,
			[Map<String, String> data = const {}]) async {
		http.Response response;
		
		if (method.toLowerCase() == "post") {
			response = await http.post(
				Uri.http(apiUrl, call),
				body: data,
				headers: await getHeaders(),
			);
		} else {
			response = await http.get(
				Uri.http(apiUrl, call, data),
				headers: await getHeaders(),
			);
		}
		print(response.body);
		return json.decode(response.body);
	}
	
	static Future<Map<String,String>> getHeaders() async => {"Auth": await getToken()};
}