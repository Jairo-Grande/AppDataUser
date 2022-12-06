part of 'new_user_form_bloc.dart';

class NewUserFormState {
  final List<CustomInput> addressList;
  final FocusNode firstFocusNode;
  const NewUserFormState(
      {required this.addressList, required this.firstFocusNode});

  NewUserFormState copyWith(
      {List<CustomInput>? addressList, FocusNode? firstFocusNode}) {
    return NewUserFormState(
        addressList: addressList ?? this.addressList,
        firstFocusNode: firstFocusNode ?? this.firstFocusNode);
  }
}
