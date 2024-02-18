import 'package:flutter/material.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/spacing.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_text.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class RegisterInfoScreen extends StatefulWidget {
  const RegisterInfoScreen({super.key});

  @override
  State<RegisterInfoScreen> createState() => _RegisterInfoScreenState();
}

class _RegisterInfoScreenState extends State<RegisterInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Crear cuenta\n',
                    style: FontConstants.subtitle2
                        .copyWith(color: Palette.primary00),
                  ),
                  TextSpan(
                    text:
                        'Ingresa los siguientes datos para la creación de tu cuenta',
                    style:
                        FontConstants.body2.copyWith(color: Palette.textMedium),
                  ),
                ],
              ),
            ),
            Spacing.textField,
            const InputWithText(
              isRequired: true,
              title: 'Nombre completo',
              hintText: 'Ingresa tu nombre completo',
            ),
            Spacing.textField,
            const InputWithText(
              isRequired: true,
              title: 'Correo electrónico',
              hintText: 'micorreo@example.com',
            ),
            Spacing.textField,
            const InputWithText(
              obscureText: true,
              isRequired: true,
              title: 'Elige una contraseña',
              hintText: '****',
            ),
            Spacing.textField,
            const InputWithText(
              obscureText: true,
              isRequired: true,
              title: 'Confirma la contraseña',
              hintText: '****',
            ),
            Spacing.textField,
            Text(
              'Ubicación',
              style: FontConstants.body1.copyWith(color: Palette.primary00),
            ),
            Spacing.textField,
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
            const Spacer(),
            Spacing.textField,
            CheckboxText(
              onChange: (value) {},
              isChecked: true,
              text: Expanded(
                child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Al continuar aceptas los ',
                        style: FontConstants.caption2,
                      ),
                      TextSpan(
                        text:
                            'términos, condiciones y políticas de tratamientos de datos.',
                        style: FontConstants.caption2.copyWith(
                          color: Palette.textLink,
                          decoration: TextDecoration.underline,
                          decorationColor: Palette.textLink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacing.textField,
            LargeButton(text: 'Continuar', onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
