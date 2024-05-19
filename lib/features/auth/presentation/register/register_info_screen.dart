import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/features/auth/data/provider/auth_provider.dart';
import 'package:pet_home/features/auth/domain/register_user/register_user.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/spacing.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class RegisterInfoScreen extends ConsumerStatefulWidget {
  const RegisterInfoScreen({required this.userType, super.key});

  final String userType;

  static const path = '/register-info';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterInfoScreenState();
}

class _RegisterInfoScreenState extends ConsumerState<RegisterInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String city = '';
  String department = '';
  bool termsAndConditions = false;
  bool get enableButton =>
      _formKey.currentState != null &&
      _formKey.currentState!.validate() &&
      termsAndConditions;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Crear cuenta\n',
                    style: FontConstants.subtitle2
                        .copyWith(color: Palette.primary),
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
            const SizedBox(height: 20),
            InputWithTitle(
              validator: (_) =>
                  TextValidators.textMandatory(_nameController.text),
              controller: _nameController,
              isRequired: true,
              title: 'Nombre completo',
              hintText: 'Ingresa tu nombre completo',
            ),
            InputWithTitle(
              validator: (_) =>
                  TextValidators.emailValidator(_emailController.text),
              controller: _emailController,
              isRequired: true,
              title: 'Correo electrónico',
              hintText: 'micorreo@example.com',
            ),
            InputWithTitle(
              validator: (_) =>
                  TextValidators.passwordValidator(_passwordController.text),
              controller: _passwordController,
              obscureText: true,
              isRequired: true,
              title: 'Elige una contraseña',
              hintText: '****',
            ),
            InputWithTitle(
              validator: (_) => TextValidators.confirmPasswordValidator(
                _confirmPasswordController.text,
                _passwordController.text,
              ),
              controller: _confirmPasswordController,
              obscureText: true,
              isRequired: true,
              title: 'Confirma la contraseña',
              hintText: '****',
            ),
            Text(
              'Ubicación',
              style: FontConstants.body1.copyWith(color: Palette.primary),
            ),
            Spacing.xSmall,
            Row(
              children: [
                Flexible(
                  child: DropdownSearchInput(
                    onChange: (value) {
                      setState(() {
                        city = '';
                        department = value;
                      });
                    },
                    asyncItems: (p0) => ref
                        .read(locationNotifierProvider.notifier)
                        .getDepartamentos(),
                    isRequired: true,
                    title: 'Departamento',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: DropdownSearchInput(
                    onChange: (value) {
                      setState(() {
                        city = value;
                      });
                    },
                    asyncItems: (p0) => department == ''
                        ? Future.value([])
                        : ref
                            .read(locationNotifierProvider.notifier)
                            .getCiudades(department),
                    isRequired: true,
                    selectedItem: city != '' ? city : null,
                    title: 'Ciudad',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Transform.scale(
                  scale: 1.16,
                  child: Radio<bool>(
                    value: true,
                    groupValue: termsAndConditions,
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                    ),
                    onChanged: (value) {
                      setState(() {
                        termsAndConditions = value ?? false;
                      });
                    },
                  ),
                ),
                Expanded(
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
              ],
            ),
            LargeButton(
              isEnabled: enableButton,
              text: 'Registrarme',
              onPressed: () => _handleRegister(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister() {
    ref.read(authNotifierProvider.notifier).register(
          user: RegisterUser(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
            widget.userType,
            department,
            city,
          ),
        );
  }
}
