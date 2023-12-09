import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Mensaje para el posible adoptante',
          style: FontConstants.body1.copyWith(
            color: Palette.primary00,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Si decides que quieres en tu vida la compañía de una vida animal, debes ser conscientes del compromiso que esto implica. La vida está llena de cambios y en los 15 años que vive en promedio un perro o un gato se van a presentar una infinidad de situaciones que deberás enfrentar de manera seria y responsable. \n Si decides adoptar un animal debes acogerlo como un miembro más de tu casa. Esto quiere decir que, pase lo que pase, el animal siempre será tenido en cuenta en las decisiones de la familia y por ningún motivo se desharán de él, como si fuera un objeto o un juguete. Ningún problema es excusa para abandonarlo, del mismo modo que no es excusa para abandonar a cualquier otro integrante de tu familia',
          style: FontConstants.body2,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LargeButton(text: 'Aceptar', onPressed: () => context.pop()),
          ),
        ],
      );
    },
  );
}
