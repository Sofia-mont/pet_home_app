import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/inputs/large_input_with_title.dart';

class QuestionaryScreen extends StatefulWidget {
  const QuestionaryScreen({super.key});

  @override
  State<QuestionaryScreen> createState() => _QuestionaryScreenState();
}

class _QuestionaryScreenState extends State<QuestionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopción',
          style:
              FontConstants.subtitle1.copyWith(color: const Color(0xFf70B765)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cuestionario',
                  style: FontConstants.subtitle2
                      .copyWith(color: const Color(0xFf70B765)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const LargeInputWithText(
                  title: '¿Por qué quiere adoptar un animal?',
                  hintText: 'Ingresa tu respuesta...',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Tipo de vivienda',
                  hintText: 'Selecciona',
                ),
                const SizedBox(
                  height: 10,
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
                  height: 10,
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
                  height: 10,
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
                  height: 10,
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
                  height: 10,
                ),
                const InputWithText(
                  title:
                      '¿Qué lugar de la vivienda estaría destinado al animal?',
                  hintText: 'Ingresa tu respuesta...',
                ),
                const SizedBox(
                  height: 30,
                ),
                LargeButton(
                  text: 'Continuar',
                  onPressed: () =>
                      context.push(RoutePath.adoptionQuestionarySecond.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
