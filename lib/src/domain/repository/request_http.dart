import 'package:flutter_application_1/src/core/global/enviroment.dart';
import 'package:flutter_application_1/src/domain/repository/repository_http.dart';

import 'package:http/http.dart' as http;

import '../../data/models/data_user_model.dart';

class Request {
  Future<http.Response> getDataUsuario() async {
    final http.Response response;
    response = await HttpService().get(ruta: RutasUsuario.baseUrl);
    return response;
  }

  Future<http.Response> postUserForm(DataUser dataUser) async {
    final http.Response response;
    response =
        await HttpService().post(ruta: RutasUsuario.baseUrl, body: dataUser);
    return response;
  }
}
