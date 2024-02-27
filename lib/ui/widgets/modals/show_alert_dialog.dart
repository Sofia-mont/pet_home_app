import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';

Future<void> showAlertDialog(
  BuildContext context,
  WidgetRef ref,
  String texto,
  Function()? action,
) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('TITULO'),
      content: Text(texto),
      actions: [
        TextButton(
            onPressed: () {
              ref.read(appRouterProvider).pop();
              if (action != null) {
                action();
              }
            },
            child: Text('Continuar'))
      ],
    ),
  ).then((value) {
    if (action != null) {
      action();
    }
  });
}
