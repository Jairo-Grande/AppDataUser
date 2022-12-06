import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/historial/view/pages/historial_page.dart';
import 'package:flutter_application_1/src/features/historial/view/pages/user_details_page.dart';
import 'package:flutter_application_1/src/features/home_page/view/pages/home_page.dart';
import 'package:flutter_application_1/src/features/new_user_form/view/pages/new_user_form.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'historial': (_) => const HistorialPage(),
  'newUser': (_) => const NewUserFormPage(),
  'home': (_) => const HomePage(),
};
