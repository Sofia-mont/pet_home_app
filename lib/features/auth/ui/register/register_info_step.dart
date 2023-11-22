import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class RegisterInfoStep extends StatefulWidget {
  const RegisterInfoStep({super.key});

  @override
  State<RegisterInfoStep> createState() => _RegisterInfoStepState();
}

class _RegisterInfoStepState extends State<RegisterInfoStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFf70B765)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Crear cuenta\n',
                        style: FontConstants.subtitle2
                            .copyWith(color: const Color(0xFf70B765)),
                      ),
                      TextSpan(
                        text:
                            'Ingresa los siguientes datos para la creación de tu cuenta',
                        style: FontConstants.body2
                            .copyWith(color: const Color(0xFfA7A7A7)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputWithText(
                  isRequired: true,
                  title: 'Nombre completo',
                  hintText: 'Ingresa tu nombre completo',
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputWithText(
                  isRequired: true,
                  title: 'Correo electrónico',
                  hintText: 'micorreo@example.com',
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputWithText(
                  obscureText: true,
                  isRequired: true,
                  title: 'Elige una contraseña',
                  hintText: '****',
                ),
                const SizedBox(
                  height: 15,
                ),
                const InputWithText(
                  obscureText: true,
                  isRequired: true,
                  title: 'Confirma la contraseña',
                  hintText: '****',
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Ubicación',
                  style: FontConstants.body1
                      .copyWith(color: const Color(0xFf70B765)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        isRequired: true,
                        title: 'Departamento',
                        hintText: 'Selecciona',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        isRequired: true,
                        title: 'Departamento',
                        hintText: 'Selecciona',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CheckboxText(
                  onChange: (value) {},
                  isChecked: true,
                  text: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Al continuar aceptas los ',
                          style: FontConstants.caption2,
                        ),
                        TextSpan(
                          text:
                              'términos, condiciones y políticas de tratamientos de datos.',
                          style: FontConstants.captionLink2.copyWith(
                            color: const Color(0xFF0073D6),
                            decorationColor: const Color(0xFF0073D6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                LargeButton(text: 'Continuar', onPressed: () => {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
