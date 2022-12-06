import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/shared_widgets/loading_alert.dart';
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
            print("error Cargando historial");
          } else if (state is CargandoHistorial) {
            loadingAlert(context, "Obteniendo Historial");
          } else if (state is MostrarHistorial) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          /*    if (state is ErrorCargandoHistorial) {
            print("Error cargando el historial");
            return (Text("Error"));
          } else if (state is CargandoHistorial) {
            loadingAlert(context, "Obteniendo Historial");
          } else */
          if (state is MostrarHistorial) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: ((context, index) {
                  return const CustomProfileCard();
                }));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
