import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/new_user_form/bloc/new_user_form/new_user_form_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController index;
  final TextEditingController label;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final IconData? iconTextField;
  final FocusNode focus;
  final FocusNode? nextFocus;
  final String? action;
  final bool isPassword;
  final TextEditingController positionController;

  const CustomInput(
      {super.key,
      required this.index,
      required this.label,
      required this.placeholder,
      required this.textController,
      required this.keyBoardType,
      required this.isPassword,
      required this.iconTextField,
      required this.focus,
      required this.nextFocus,
      required this.action,
      required this.positionController});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

Color textColor = Colors.black54;
late bool editable = true;
IconButton? iconButton;

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
/*     if (widget.iconTextField == Icons.calendar_month_outlined) {
      editable = false;
    } else {
      editable = true;
    } */
    final newUserFormBloc = BlocProvider.of<NewUserFormBloc>(context);

    if (widget.iconTextField == null) {
      iconButton = null;
    } else {
      if (widget.iconTextField == Icons.calendar_month_outlined) {
        iconButton = IconButton(
          onPressed: (() {
            //   editable = false;
            showDataPicker();
          }),
          icon: Icon(widget.iconTextField),
          focusNode: widget.focus,
        );
      } else {
        iconButton = IconButton(
            onPressed: (() {
              if (widget.iconTextField == Icons.add) {
                newUserFormBloc.add(const AddAddressUser());
              } else if (widget.iconTextField == Icons.close) {
                newUserFormBloc.add(DeleteAddressUser(
                    indexToDelete: int.parse(widget.index.text)));
              } else if (widget.iconTextField ==
                  Icons.calendar_month_outlined) {
                // editable = false;
                showDataPicker();
              }
            }),
            icon: Icon(widget.iconTextField));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.label.text,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.005),
                          offset: const Offset(0, 5),
                          blurRadius: 15,
                        )
                      ]),
                  child: TextField(
                    enabled: editable,
                    focusNode: widget.focus,
                    controller: widget.textController,
                    autocorrect: false,
                    keyboardType: widget.keyBoardType,
                    obscureText: widget.isPassword,
                    onEditingComplete: () {
                      requestFocus(context, widget.nextFocus!);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: widget.placeholder,
                        hintStyle: TextStyle(
                            fontSize: 12, color: Colors.grey.shade400)),
                  ),
                ),
              ),
              if (iconButton != null) iconButton!
            ],
          ),
        ),
      ],
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  showDataPicker() {
    return showDatePicker(
            locale: const Locale('es', "ES"),
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1920),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        widget.textController.text =
            "${value!.day} / ${value.month} / ${value.year}";
        requestFocus(context, widget.nextFocus!);
      }
      return;
    });
  }
}

class NotificationAction extends Notification {}
