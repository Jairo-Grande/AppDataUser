import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/new_user_form/view/widgets/custom_input.dart';

part 'new_user_form_event.dart';
part 'new_user_form_state.dart';

int initialIndex = 5;
int focusIndex = 0;

FocusNode initialAddressNode = FocusNode();

FocusNode focusNodeInitial = FocusNode();

List<CustomInput> initialAddressList = [
  CustomInput(
    index: TextEditingController(text: "$initialIndex"),
    focus: initialAddressNode,
    isPassword: false,
    keyBoardType: TextInputType.datetime,
    label: TextEditingController(text: "Direccion :"),
    textController: TextEditingController(),
    placeholder: "Seleccione su fecha de nacimiento",
    iconTextField: Icons.add,
    nextFocus: focusNodeInitial,
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
    FocusNode nextNewFocusNode = FocusNode();

    initialIndex += 1;

    int contador = 1;

    //focus Node Logic here.

    CustomInput newAddressInput = CustomInput(
      index: TextEditingController(text: "$initialIndex"),
      focus: nextNewFocusNode,
      isPassword: false,
      keyBoardType: TextInputType.streetAddress,
      label: TextEditingController(),
      positionController: TextEditingController(),
      textController: TextEditingController(),
      placeholder: "Seleccione su fecha de nacimiento",
      iconTextField: Icons.close,
      nextFocus: initialAddressList[0].focus,
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

    focusIndex += 1;
  }

  _removeAddressUser(DeleteAddressUser event, Emitter<NewUserFormState> emit) {
    late CustomInput addressToRemove;
    int contador = 1;

    for (CustomInput address in initialAddressList) {
      if (int.parse(address.index.text) == event.indexToDelete) {
        addressToRemove = address;
      }
    }
    addressToRemove.focus.dispose();
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

  Future _sendForm(SendForm event, Emitter<NewUserFormState> emit) async {}
}
