part of 'new_user_form_bloc.dart';

abstract class NewUserFormEvent extends Equatable {
  const NewUserFormEvent();
  @override
  List<Object> get props => [];
}

class AddAddressUser extends NewUserFormEvent {
  const AddAddressUser();
}

class DeleteAddressUser extends NewUserFormEvent {
  final int indexToDelete;
  const DeleteAddressUser({required this.indexToDelete});
}

class ShowAddressUserList extends NewUserFormEvent {
  const ShowAddressUserList();
}

class SendForm extends NewUserFormEvent {
  const SendForm();
}
