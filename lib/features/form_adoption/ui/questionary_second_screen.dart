import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_third_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopción',
          style: FontConstants.subtitle1.copyWith(color: Palette.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¿Tú o algun miembro de la familia es alérgico al pelo de gato o perro?',
                        style: FontConstants.body2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 30,
                            child: CheckboxText(
                              onChange: () => {},
                              text: const Text('Sí'),
                              isChecked: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 30,
                            child: CheckboxText(
                              onChange: () => {},
                              text: const Text('No'),
                              isChecked: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '¿Puede cubrir económicamente sus necesidades: alimento, cuentas veterinarias, vacunas, correas, juguetes, medicinas, elementos de higiene?',
                        style: FontConstants.body2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 30,
                            child: CheckboxText(
                              onChange: () => {},
                              text: const Text('Sí'),
                              isChecked: false,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 30,
                            child: CheckboxText(
                              onChange: () => {},
                              text: const Text('No'),
                              isChecked: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const InputWithTitle(
                        title:
                            '¿Cuántas horas del día permanecería solo el animal?',
                        hintText: 'Ingresa tu respuesta...',
                      ),
                      const InputWithTitle(
                        title:
                            '¿Qué tiempo diario dispone para compartir con el animal?',
                        hintText: 'Ingresa tu respuesta...',
                      ),
                      const InputWithTitle(
                        title:
                            '¿Qué sucedería si alguien resultara alérgico al animal?',
                        hintText: 'Ingresa tu respuesta...',
                        isMultiline: true,
                      ),
                      const InputWithTitle(
                        title:
                            '¿Qué sucedería si usted o, en caso de ser hombre, su pareja quedara embarazada?',
                        hintText: 'Ingresa tu respuesta...',
                        isMultiline: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: LargeButton(
                text: 'Continuar',
                onPressed: () => ref
                    .read(appRouterProvider)
                    .push(QuestionaryThirdScreen.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
