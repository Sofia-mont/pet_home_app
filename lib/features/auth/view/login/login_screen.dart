import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/spacing.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      withPadding: false,
      appbarElevation: 0,
      appbarColor: Palette.primary00,
      body: Column(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 186,
              color: Palette.primary00,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/img/pethome_logo.png',
            width: 152,
          ),
          Text(
            'Pet Home',
            style: FontConstants.heading1.copyWith(color: Palette.primary00),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: LargeButton(
              text: 'Iniciar sesión',
              onPressed: () => ref.read(appRouterProvider).push('/login-index'),
            ),
          ),
          TextButton(
            onPressed: () => ref.read(appRouterProvider).push('/register'),
            child: Text(
              'Crear cuenta',
              style: FontConstants.body1.copyWith(
                color: Palette.primary00,
                decoration: TextDecoration.underline,
                decorationColor: Palette.primary00,
              ),
            ),
          ),
          Spacing.textField,
        ],
      ),
    );
  }
}
