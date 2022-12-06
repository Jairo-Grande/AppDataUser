import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/src/data/models/data_user_model.dart';
import 'package:flutter_application_1/src/domain/repository/request_http.dart';

import 'package:http/http.dart' as http;

part 'historial_event.dart';
part 'historial_state.dart';

class HistorialBloc extends Bloc<HistorialEvent, HistorialState> {
  HistorialBloc() : super(HistorialInitial()) {
    on<SolicitudHistorial>(_solicitudHistorial);
  }

  Future<void> _solicitudHistorial(
      SolicitudHistorial event, Emitter<HistorialState> emit) async {
    emit(CargandoHistorial());
    http.Response response;
    response = await Request().getDataUsuario();
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, DataUser> dataUser = dataUserFromJson(response.body);
      emit(MostrarHistorial(dataUser));
    } else {
      emit(const ErrorCargandoHistorial("Error Cargando el Historial"));
    }
  }
}
