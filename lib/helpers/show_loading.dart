import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Espere por favor'),
              content: Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(top: 10),
                child: const Column(
                  children: [
                    Text('Calculando Ruta'),
                    SizedBox(height: 15),
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ));
    return;
  }
  showCupertinoDialog(
      context: context,
      builder: (context) => const CupertinoAlertDialog(
            title: Text('Espere por favor'),
            content: CupertinoActivityIndicator(),
          ));
}
