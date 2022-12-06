import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/home_page/bloc/bottom_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBloc = context.read<BottomNavigationBloc>();

    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (currentIndex) {
            bottomNavigationBloc.add(TabChangedEvent(currentIndex));
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add), label: "Nuevo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: "Historial"),
          ],
        );
      },
    );
  }
}
