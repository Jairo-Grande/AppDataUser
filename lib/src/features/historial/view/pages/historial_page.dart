import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/shared_widgets/loading_alert.dart';
import 'package:flutter_application_1/src/data/models/data_user_model.dart';
import 'package:flutter_application_1/src/features/historial/bloc/bloc/historial_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_profile_card.dart';

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historialBloc = BlocProvider.of<HistorialBloc>(context);
    historialBloc.add(const SolicitudHistorial());
    return SingleChildScrollView(
      child: BlocConsumer<HistorialBloc, HistorialState>(
        listener: (context, state) {
          if (state is ErrorCargandoHistorial) {
            Navigator.of(context).pop();
          } else if (state is CargandoHistorial) {
            loadingAlert(context, "Obteniendo Historial");
          } else if (state is MostrarHistorial) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is MostrarHistorial) {
            List<DataUser> listadoUsuarios = [];
            state.dataUser.forEach((k, DataUser data) => listadoUsuarios.add(
                DataUser(
                    direccion: data.direccion,
                    fechaNacimiento: data.fechaNacimiento,
                    primerApellido: data.primerApellido,
                    primerNombre: data.primerNombre,
                    segundoApellido: data.segundoApellido,
                    segundoNombre: data.segundoNombre)));

            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.dataUser.length,
                itemBuilder: ((context, index) {
                  return CustomProfileCard(dataUser: listadoUsuarios[index]);
                }));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
