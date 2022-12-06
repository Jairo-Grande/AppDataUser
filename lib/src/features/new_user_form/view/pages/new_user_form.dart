import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/new_user_form/bloc/new_user_form/new_user_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_input.dart';

class NewUserFormPage extends StatefulWidget {
  const NewUserFormPage({super.key});

  @override
  State<NewUserFormPage> createState() => _NewUserFormPageState();
}

final nombre = TextEditingController();

//late FocusNode firstNameFocus;
late FocusNode secondNameFocus;
late FocusNode fistLastNameFocus;
late FocusNode secondLastNameFocus;
late FocusNode addressFocus;
late FocusNode dateOfBirth;
int addressCount = 1;
IconData iconAddress = Icons.add;
String action = "agregar";

class _NewUserFormPageState extends State<NewUserFormPage> {
  @override
  void initState() {
    //firstNameFocus = FocusNode();
    secondNameFocus = FocusNode();
    fistLastNameFocus = FocusNode();
    secondLastNameFocus = FocusNode();
    dateOfBirth = FocusNode();
    addressFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newUserFormBloc = BlocProvider.of<NewUserFormBloc>(context);
    return BlocBuilder<NewUserFormBloc, NewUserFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
            child: Form(
                child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: CustomInput(
                    index: TextEditingController(text: "0"),
                    focus: state.firstFocusNode,
                    isPassword: false,
                    keyBoardType: TextInputType.name,
                    label: TextEditingController(text: "Primer Nombre :"),
                    textController: nombre,
                    placeholder: "ingrese el primer nombre",
                    iconTextField: null,
                    nextFocus: secondNameFocus,
                    action: null,
                    positionController: TextEditingController()),
              ),
              Expanded(
                child: CustomInput(
                    index: TextEditingController(text: "1"),
                    focus: secondNameFocus,
                    isPassword: false,
                    keyBoardType: TextInputType.name,
                    label: TextEditingController(text: "Segundo Nombre :"),
                    textController: nombre,
                    placeholder: "Ingrese su segundo nombre",
                    iconTextField: null,
                    nextFocus: fistLastNameFocus,
                    action: null,
                    positionController: TextEditingController()),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomInput(
                    index: TextEditingController(text: "2"),
                    focus: fistLastNameFocus,
                    isPassword: false,
                    keyBoardType: TextInputType.name,
                    label: TextEditingController(text: "Primer Apellido :"),
                    textController: nombre,
                    placeholder: "Ingrese el primer apellido",
                    iconTextField: null,
                    nextFocus: secondLastNameFocus,
                    action: null,
                    positionController: TextEditingController()),
              ),
              Expanded(
                child: CustomInput(
                    index: TextEditingController(text: "3"),
                    focus: secondLastNameFocus,
                    isPassword: false,
                    keyBoardType: TextInputType.name,
                    label: TextEditingController(text: "Segundo Apellido :"),
                    textController: nombre,
                    placeholder: "Ingrese el segundo apellido",
                    iconTextField: null,
                    nextFocus: dateOfBirth,
                    action: null,
                    positionController: TextEditingController()),
              )
            ],
          ),
          CustomInput(
            index: TextEditingController(text: "4"),
            focus: dateOfBirth,
            isPassword: false,
            keyBoardType: TextInputType.datetime,
            label: TextEditingController(text: "Fecha de Nacimiento:"),
            textController: nombre,
            placeholder: "Seleccione su fecha de nacimiento",
            iconTextField: Icons.calendar_month_outlined,
            nextFocus: newUserFormBloc.state.addressList.first.focus,
            action: null,
            positionController: TextEditingController(),
          ),
          ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: state.addressList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return state.addressList[index];
              }),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size.fromHeight(40)),
              onPressed: () {
                newUserFormBloc.add(const SendForm());
              },
              child: const Text(
                "Enviar Datos",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ))
        ])));
      },
    );
  }

  @override
  void dispose() {
    //firstNameFocus.dispose();
    secondNameFocus.dispose();
    fistLastNameFocus.dispose();
    secondLastNameFocus.dispose();
    dateOfBirth.dispose();
    addressFocus.dispose();
    super.dispose();
  }
}
