import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.primary00,
        automaticallyImplyLeading: false,
      ),
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
              onPressed: () => context.push(RoutePath.loginUser.path),
            ),
          ),
          TextButton(
            onPressed: () => context.push(RoutePath.register.path),
            child: Text(
              'Crear cuenta',
              style: FontConstants.body1.copyWith(
                color: Palette.primary00,
                decoration: TextDecoration.underline,
                decorationColor: Palette.primary00,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
