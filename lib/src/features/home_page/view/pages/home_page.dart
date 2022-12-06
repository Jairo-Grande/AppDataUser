import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/historial/view/pages/historial_page.dart';
import 'package:flutter_application_1/src/features/home_page/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_application_1/src/features/home_page/view/widgets/bottom_navigation_bar.dart';
import 'package:flutter_application_1/src/features/new_user_form/view/pages/new_user_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BottomNavigationBloc, int>(
        builder: (context, currentTabIndex) {
          if (currentTabIndex == 1) {
            return const HistorialPage();
          } else {
            return const NewUserFormPage();
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
