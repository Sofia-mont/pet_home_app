import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/inputs/large_input_with_title.dart';

class QuestionaryScreen extends ConsumerStatefulWidget {
  const QuestionaryScreen({super.key});

  @override
  ConsumerState<QuestionaryScreen> createState() => _QuestionaryScreenState();
}

class _QuestionaryScreenState extends ConsumerState<QuestionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopción',
          style: FontConstants.subtitle1.copyWith(color: Palette.primary00),
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
                        'Cuestionario',
                        style: FontConstants.subtitle2
                            .copyWith(color: Palette.primary00),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LargeInputWithText(
                        title: '¿Por qué quiere adoptar un animal?',
                        hintText: 'Ingresa tu respuesta...',
                      ),
                      const InputWithText(
                        title: 'Tipo de vivienda',
                        hintText: 'Selecciona',
                      ),
                      Text(
                        '¿La vivienda es propia o de alquiler?',
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
                              text: const Text('Propia'),
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
                              text: const Text('Alquiler'),
                              isChecked: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '¿El reglamento de su vivienda permite mascotas?',
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
                              text: const Text('Si'),
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
                        '¿Su vivienda tiene patio, terraza o jardín? Si es así, ¿es cubierto?',
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
                              text: const Text('Si'),
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
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 30,
                            child: CheckboxText(
                              onChange: () => {},
                              text: const Text('No tiene'),
                              isChecked: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '¿Está dispuesto a colocar protecciones para prevenir escapes y accidentes?',
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
                              text: const Text('Si'),
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
                      const InputWithText(
                        title:
                            '¿Qué lugar de la vivienda estaría destinado al animal?',
                        hintText: 'Ingresa tu respuesta...',
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
                    .push('/adoption-form-questionary-2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
