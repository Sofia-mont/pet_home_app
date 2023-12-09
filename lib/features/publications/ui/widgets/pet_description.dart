import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';

class PetDescription extends StatelessWidget {
  const PetDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: FontConstants.body1,
              children: [
                //DUEÑO
                const TextSpan(text: 'Dueño: '),
                TextSpan(text: 'Martina Perez\n', style: FontConstants.body2),
                const WidgetSpan(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                //EDAD
                const TextSpan(text: 'Edad: '),
                TextSpan(text: '4 meses\n', style: FontConstants.body2),
                const WidgetSpan(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                //VACUNADO
                const TextSpan(text: 'Vacunado: '),
                TextSpan(text: 'Sí\n', style: FontConstants.body2),
                const WidgetSpan(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                //CASTRADO
                const TextSpan(text: 'Castrado: '),
                TextSpan(text: 'No Perez\n', style: FontConstants.body2),
                const WidgetSpan(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                //TAMAÑO
                const TextSpan(text: 'Tamaño: '),
                TextSpan(text: 'Pequeño\n', style: FontConstants.body2),
                const WidgetSpan(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                //PERSONALIDAD
                const TextSpan(text: 'Personalidad: '),
                TextSpan(
                  text:
                      'Firulais es un perro muy tierno que le encanta jugar con los niños, es muy tranquilo y reservado, también es timido con otros perritos pero cuando entra en confianza es muy juguetón\n',
                  style: FontConstants.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
