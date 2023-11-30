import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/large_input_with_title.dart';

class QuestionaryThirdScreen extends StatefulWidget {
  const QuestionaryThirdScreen({super.key});

  @override
  State<QuestionaryThirdScreen> createState() => _QuestionaryThirdScreenState();
}

class _QuestionaryThirdScreenState extends State<QuestionaryThirdScreen> {
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
                const LargeInputWithText(
                  title:
                      '¿Anteriormente ha tenido animales en casa? ¿Cuál (es)? ¿Qué paso con ellos?',
                  hintText: 'Ingresa tu respuesta...',
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
                  height: 10,
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
                  height: 10,
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
                  height: 10,
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
                  height: 30,
                ),
                LargeButton(
                  text: 'Enviar solicitud',
                  onPressed: () =>
                      context.push(RoutePath.adoptionQuestionaryThird.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
