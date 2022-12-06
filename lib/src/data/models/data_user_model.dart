// To parse this JSON data, do
//
//     final dataUser = dataUserFromJson(jsonString);

import 'dart:convert';

Map<String, DataUser> dataUserFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, DataUser>(k, DataUser.fromJson(v)));

String dataUserToJson(DataUser data) => json.encode(data.toJson());

class DataUser {
  DataUser({
    required this.direccion,
    required this.fechaNacimiento,
    required this.primerApellido,
    required this.primerNombre,
    required this.segundoApellido,
    required this.segundoNombre,
  });

  List<String> direccion;
  String fechaNacimiento;
  String primerApellido;
  String primerNombre;
  String segundoApellido;
  String segundoNombre;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        direccion: List<String>.from(json["direccion"].map((x) => x)),
        fechaNacimiento: json["fecha_nacimiento"],
        primerApellido: json["primer_apellido"],
        primerNombre: json["primer_nombre"],
        segundoApellido: json["segundo_apellido"],
        segundoNombre: json["segundo_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "direccion": List<dynamic>.from(direccion.map((x) => x)),
        "fecha_nacimiento": fechaNacimiento,
        "primer_apellido": primerApellido,
        "primer_nombre": primerNombre,
        "segundo_apellido": segundoApellido,
        "segundo_nombre": segundoNombre,
      };
}
