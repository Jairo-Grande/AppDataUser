part of 'historial_bloc.dart';

abstract class HistorialState extends Equatable {
  const HistorialState();

  @override
  List<Object> get props => [];
}

class HistorialInitial extends HistorialState {}

class CargandoHistorial extends HistorialState {}

class MostrarHistorial extends HistorialState {
  final Map<String, DataUser> dataUser;
  const MostrarHistorial(this.dataUser);
}

class ErrorCargandoHistorial extends HistorialState {
  final String error;
  const ErrorCargandoHistorial(this.error);
}
