import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/features/historial/bloc/bloc/historial_bloc.dart';
import 'package:flutter_application_1/src/features/home_page/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_application_1/src/features/new_user_form/bloc/new_user_form/new_user_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (_) => BottomNavigationBloc()),
      BlocProvider(create: (_) => NewUserFormBloc()),
      BlocProvider(create: (_) => HistorialBloc()),
    ], child: const App()));
