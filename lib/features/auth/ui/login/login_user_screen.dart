import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFf70B765),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).viewInsets.bottom == 0 ? 152 : 0,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                color: const Color(0xFf70B765),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).viewInsets.bottom == 0 ? 152 : 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset(
                'assets/img/pethome_logo.png',
                width: 152,
              ),
            ),
          ),
          Expanded(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const InputWithText(
                        title: 'Correo eléctronico',
                        hintText: 'micorreo@example.com',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const InputWithText(
                        title: 'Contraseña',
                        hintText: '**********',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      LargeButton(
                        text: 'Iniciar sesión',
                        onPressed: () => context.push(RoutePath.home.path),
                      ),
                      TextButton(
                        onPressed: () => {
                          //context.push('/register'),
                        },
                        child: Text(
                          '¡Olvidé mi contraseña!',
                          style: FontConstants.bodyLink1.copyWith(
                            color: const Color(0xFf70B765),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
