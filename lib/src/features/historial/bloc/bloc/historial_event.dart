part of 'historial_bloc.dart';

abstract class HistorialEvent extends Equatable {
  const HistorialEvent();

  @override
  List<Object> get props => [];
}

class SolicitudHistorial extends HistorialEvent {
  const SolicitudHistorial();
}
