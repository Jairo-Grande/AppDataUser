import 'package:flutter_application_1/src/core/global/enviroment.dart';
import 'package:flutter_application_1/src/domain/repository/repository_http.dart';

import 'package:http/http.dart' as http;

class Request {
  Future<http.Response> getDataUsuario() async {
    final http.Response response;
    response = await HttpService().get(ruta: RutasUsuario.baseUrl);
    return response;
  }
}
