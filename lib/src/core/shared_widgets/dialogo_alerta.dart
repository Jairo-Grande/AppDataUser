import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

dialogoAlerta({
  required BuildContext context,
  required String titulo,
  required String subtitulo,
}) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                titulo,
                style: const TextStyle(color: Colors.blue),
              ),
              content: Text(
                subtitulo,
              ),
              actions: [
                MaterialButton(
                    elevation: 5,
                    color: Colors.blue,
                    child: const Text(
                      maxLines: 1,
                      'Aceptar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.pop(context))
              ],
            ));
  } else {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
          title: Text(titulo),
          content: Text(subtitulo),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context))
          ]),
    );
  }
}
