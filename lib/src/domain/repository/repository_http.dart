import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class HttpService {
  HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = HttpService._internal();

  Future<Map<String, String>> _getHeaders() async {
    return {
      "Accept": "application/json",
    };
  }

  Future<http.Response> get({required String ruta}) async {
    Map<String, String> headers = await _getHeaders();
    http.Response response;
    HttpOverrides.global = DevHttpOverrides();
    response = await http.get(Uri.parse(ruta), headers: headers);
    return response;
  }

  Future<http.Response> post({required String ruta, dynamic body}) async {
    http.Response response;
    HttpOverrides.global = DevHttpOverrides();
    Map<String, String> headers = await _getHeaders();
    response = await http.post(Uri.parse(ruta),
        headers: headers, body: jsonEncode(body));
    return response;
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
