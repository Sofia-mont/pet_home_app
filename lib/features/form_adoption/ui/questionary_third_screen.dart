import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/form_adoption/ui/success_form_sent_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class QuestionaryThirdScreen extends ConsumerStatefulWidget {
  const QuestionaryThirdScreen({super.key});

  static const path = '/adoption-form-questionary-3';

  @override
  ConsumerState<QuestionaryThirdScreen> createState() =>
      _QuestionaryThirdScreenState();
}

class _QuestionaryThirdScreenState
    extends ConsumerState<QuestionaryThirdScreen> {
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
                      const InputWithTitle(
                        title:
                            '¿Anteriormente ha tenido animales en casa? ¿Cuál (es)? ¿Qué paso con ellos?',
                        hintText: 'Ingresa tu respuesta...',
                        isMultiline: true,
                      ),
                      Text(
                        '¿Es consciente de que un animal puede dañar o morder sus muebles y/o pertenencias?',
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
                        '¿Es consciente que al adoptar un perro/gato debe educarlo y ser paciente mientras este se adapta a su nueva familia y hábitos?',
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
                        'Si la adopción se concreta, ¿está de acuerdo con recibir visitas de seguimiento periódicas y enviar fotografías cada vez que solicite para el respectivo seguimiento?',
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
                        '¿Se compromete a hacer la esterilización apenas cumpla 4 meses en caso de ser hembra y en el caso del macho apenas esté listo aproximadamente entre 6 o 7 meses?',
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
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: LargeButton(
                text: 'Enviar solicitud',
                onPressed: () => ref
                    .read(appRouterProvider)
                    .push(SuccessFormSentScreen.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
