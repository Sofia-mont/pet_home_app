import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos del candidato',
                  style: FontConstants.subtitle2
                      .copyWith(color: const Color(0xFf70B765)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Nombre completo',
                  hintText: 'Ingresa tu nombre completo',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Edad',
                  hintText: 'Ingresa tu edad',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        title: 'Departamento',
                        hintText: 'Selecciona',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        title: 'Municipio',
                        hintText: 'Selecciona',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Barrio',
                  hintText: 'Selecciona',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Dirección',
                  hintText: 'Ingresa la dirección completa de tu hogar',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        title: 'Teléfono fijo',
                        hintText: '604 123 4567',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      child: const InputWithText(
                        title: 'Celular',
                        hintText: '312 456 6789',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Correo electrónico',
                  hintText: 'micorreo@example.com',
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithText(
                  title: 'Ocupación',
                  hintText: 'Ingresa tu ocupación',
                ),
                const SizedBox(
                  height: 30,
                ),
                LargeButton(
                  text: 'Continuar',
                  onPressed: () =>
                      context.push(RoutePath.adoptionFamilyData.path),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
