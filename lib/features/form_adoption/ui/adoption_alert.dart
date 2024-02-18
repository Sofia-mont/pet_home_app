import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class AdoptionAlert extends ConsumerWidget {
  const AdoptionAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/pets.png',
              width: 150,
            ),
            Text(
              'Mensaje para el posible adoptante',
              style: FontConstants.subtitle1.copyWith(color: Palette.primary00),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Si decides que quieres en tu vida la compañía de una vida animal, debes ser consciente del compromiso que esto implica. La vida está llena de cambios y en los 15 años que vive en promedio un perro o un gato se van a presentar una infinidad de situaciones que deberás enfrentar de manera seria y responsable.',
              style: FontConstants.body2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Si decides adoptar un animal debes acogerlo como un miembro más de tu casa. Esto quiere decir que, pase lo que pase, el animal siempre será tenido en cuenta en las decisiones de la familia y por ningún motivo se desharán de él, como si fuera un objeto o un juguete. Ningún problema es excusa para abandonarlo, del mismo modo que no es excusa para abandonar a cualquier otro integrante de tu familia',
              style: FontConstants.body2,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LargeButton(
          text: 'Aceptar',
          onPressed: () => ref
              .read(appRouterProvider)
              .pushReplacement('/adoption-form-personal-information'),
        ),
      ),
    );
  }
}
