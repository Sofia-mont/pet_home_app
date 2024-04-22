import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/adoption_conditions_screen.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class QuestionarySecondScreen extends ConsumerStatefulWidget {
  const QuestionarySecondScreen({super.key});

  static const path = '/adoption-form-questionary-2';

  @override
  ConsumerState<QuestionarySecondScreen> createState() =>
      _QuestionarySecondScreenState();
}

class _QuestionarySecondScreenState
    extends ConsumerState<QuestionarySecondScreen> {
  @override
  Widget build(BuildContext context) {
    String esAlergico = '';
    String cubrirEconomia = '';
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxSelect(
              title:
                  '¿Tú o algun miembro de la familia es alérgico al pelo de gato o perro?',
              options: const ['Sí', 'No'],
              groupValue: esAlergico,
            ),
            CheckboxSelect(
              title:
                  '¿Puede cubrir económicamente sus necesidades: alimento, cuentas veterinarias, vacunas, correas, juguetes, medicinas, elementos de higiene?',
              options: const ['Sí', 'No'],
              groupValue: cubrirEconomia,
            ),
            const InputWithTitle(
              title: '¿Cuántas horas del día permanecería solo el animal?',
              hintText: 'Ingresa tu respuesta...',
            ),
            const InputWithTitle(
              title: '¿Qué tiempo diario dispone para compartir con el animal?',
              hintText: 'Ingresa tu respuesta...',
            ),
            const InputWithTitle(
              title: '¿Qué sucedería si alguien resultara alérgico al animal?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            const InputWithTitle(
              title:
                  '¿Qué sucedería si usted o, en caso de ser hombre, su pareja quedara embarazada?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            const InputWithTitle(
              title:
                  '¿Anteriormente ha tenido animales en casa? ¿Cuál (es)? ¿Qué paso con ellos?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            LargeButton(
              text: 'Continuar',
              onPressed: () => ref
                  .read(appRouterProvider)
                  .push(AdoptionConditionsScreen.path),
            ),
          ],
        ),
      ),
    );
  }
}
