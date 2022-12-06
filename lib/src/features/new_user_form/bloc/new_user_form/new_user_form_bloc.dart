import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/new_user_form/view/widgets/custom_input.dart';
import 'package:flutter_application_1/src/features/new_user_form/view/widgets/custom_snack_bar.dart';

import 'package:http/http.dart' as http;

import '../../../../data/models/data_user_model.dart';
import '../../../../domain/repository/request_http.dart';

part 'new_user_form_event.dart';
part 'new_user_form_state.dart';

int initialIndex = 5;

FocusNode initialAddressNode = FocusNode();

FocusNode focusNodeInitial = FocusNode();

List<CustomInput> initialAddressList = [
  CustomInput(
    index: TextEditingController(text: "$initialIndex"),
    focus: null,
    isPassword: false,
    keyBoardType: TextInputType.streetAddress,
    label: TextEditingController(text: "Direccion :"),
    textController: TextEditingController(),
    placeholder: "Agregue la direccion",
    iconTextField: Icons.add,
    nextFocus: null,
    action: null,
    positionController: TextEditingController(),
  )
];

class NewUserFormBloc extends Bloc<NewUserFormEvent, NewUserFormState> {
  NewUserFormBloc()
      : super(NewUserFormState(
            addressList: initialAddressList,
            firstFocusNode: focusNodeInitial)) {
    on<AddAddressUser>(_addAddresUser);
    on<DeleteAddressUser>(_removeAddressUser);
    on<SendForm>(_sendForm);
  }

  _addAddresUser(AddAddressUser event, Emitter<NewUserFormState> emit) {
    initialIndex += 1;

    int contador = 1;

    //focus Node Logic here.

    CustomInput newAddressInput = CustomInput(
      index: TextEditingController(text: "$initialIndex"),
      focus: null,
      isPassword: false,
      keyBoardType: TextInputType.streetAddress,
      label: TextEditingController(),
      positionController: TextEditingController(),
      textController: TextEditingController(),
      placeholder: "Agregue la direccion",
      iconTextField: Icons.close,
      nextFocus: null,
      action: null,
    );

    initialAddressList.insert(0, newAddressInput);

    for (CustomInput address in initialAddressList) {
      address.label.text = "Direccion $contador :";

      if (int.parse(address.index.text) - 5 == initialAddressList.length - 1) {
        address.positionController.text = "ultimo";
      } else {
        address.positionController.text = "No ultimo";
      }
      contador += 1;
      emit(state.copyWith(addressList: initialAddressList));
    }
  }

  _removeAddressUser(DeleteAddressUser event, Emitter<NewUserFormState> emit) {
    late CustomInput addressToRemove;
    int contador = 1;

    for (CustomInput address in initialAddressList) {
      if (int.parse(address.index.text) == event.indexToDelete) {
        addressToRemove = address;
      }
    }
    initialAddressList.remove(addressToRemove);

    //Validar los labels de la lista para que se muestren de manera correcta.
    for (CustomInput address in initialAddressList) {
      address.label.text = "Direccion $contador :";
      contador += 1;
    }

    if (initialAddressList.length == 1) {
      initialAddressList[0].label.text = "Direccion :";
    }

    emit(state.copyWith(addressList: initialAddressList));
  }

  Future _sendForm(SendForm event, Emitter<NewUserFormState> emit,
      [bool mounted = true]) async {
    http.Response response;
    response = await Request().postUserForm(event.dataUser);

    if (response.statusCode == HttpStatus.ok) {
      if (!mounted) return;
      // Navigator.of(event.context).pop();
      toggleConfirmBotton(event.context);
    } else {
      print("error de conexion");
    }
  }

  void toggleConfirmBotton(BuildContext context) {
    CustomSnackBar(context, const Text('Registro enviado con exito'),
        backgroundColor: Colors.green, snackBarAction: null);
  }

  void toggleErrorBotton(BuildContext context) {
    CustomSnackBar(context, const Text('Registro enviado con exito'),
        backgroundColor: Colors.green, snackBarAction: null);
  }
}
