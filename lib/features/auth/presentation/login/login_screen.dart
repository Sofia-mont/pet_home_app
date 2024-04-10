import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/auth/presentation/login/login_user_screen.dart';
import 'package:pet_home/features/auth/presentation/register/register_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();

  static const path = '/login';
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withPadding: false,
      appbarElevation: 0,
      appbarColor: Palette.primary,
      body: Column(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Palette.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/pethome_logo.png',
                    width: 152,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Pet Home',
                    style: FontConstants.heading1
                        .copyWith(color: Palette.textLight),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LargeButton(
                  text: 'Iniciar sesión',
                  onPressed: () =>
                      ref.read(appRouterProvider).push(LoginUserScreen.path),
                ),
              ),
              TextButton(
                onPressed: () =>
                    ref.read(appRouterProvider).push(RegisterScreen.path),
                child: Text(
                  'Crear cuenta',
                  style: FontConstants.body1.copyWith(
                    color: Palette.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: Palette.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
