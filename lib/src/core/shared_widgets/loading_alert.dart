import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

loadingAlert(BuildContext context, String titulo) {
  if (Platform.isAndroid) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                titulo,
                style: const TextStyle(),
                textAlign: TextAlign.center,
              ),
              content: const Center(
                  heightFactor: 1,
                  widthFactor: 1,
                  child: CircularProgressIndicator()),
            ));
  } else {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(titulo),
//TODO: REALIZAR EL LOADING PARA IOS.
      ),
    );
  }
}
