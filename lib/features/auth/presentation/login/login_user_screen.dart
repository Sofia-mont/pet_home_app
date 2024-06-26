import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/features/auth/data/provider/auth_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class LoginUserScreen extends ConsumerStatefulWidget {
  const LoginUserScreen({super.key});

  static const path = '/login-index';
  @override
  ConsumerState<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends ConsumerState<LoginUserScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withPadding: false,
      appbarElevation: 0,
      appbarColor: Palette.primary,
      appbarIconColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).viewInsets.bottom == 0
                ? MediaQuery.of(context).size.height * 0.4
                : 100,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: Palette.primary,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height:
                      MediaQuery.of(context).viewInsets.bottom == 0 ? 152 : 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    child: Image.asset(
                      'assets/img/pethome_logo.png',
                      width: 152,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputWithTitle(
                    title: 'Correo eléctronico',
                    hintText: 'micorreo@example.com',
                    controller: _emailController,
                    validator: (_) =>
                        TextValidators.emailValidator(_emailController.text),
                  ),
                  InputWithTitle(
                    title: 'Contraseña',
                    hintText: '**********',
                    controller: _passwordController,
                    obscureText: true,
                    validator: (_) => TextValidators.passwordValidator(
                      _passwordController.text,
                    ),
                  ),
                  LargeButton(
                    text: 'Iniciar sesión',
                    onPressed: () => _handleLogin(),
                  ),
                  TextButton(
                    onPressed: () => {
                      //TODO : URL
                    },
                    child: Text(
                      '¡Olvidé mi contraseña!',
                      style: FontConstants.body1.copyWith(
                        color: Palette.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: Palette.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    final passError =
        TextValidators.passwordValidator(_passwordController.text);
    final emailError = TextValidators.emailValidator(_emailController.text);
    if (passError != null || emailError != null) {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Error',
            content: 'Digita el email y/o la contraseña correctamente',
            buttonText: 'Aceptar',
          );
    } else {
      ref.read(authNotifierProvider.notifier).login(
            email: _emailController.text,
            password: _passwordController.text,
          );
    }
  }
}
