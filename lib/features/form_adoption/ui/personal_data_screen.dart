import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario de adopción',
          style: FontConstants.subtitle1.copyWith(color: Palette.primary00),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Datos del candidato',
                        style: FontConstants.subtitle2
                            .copyWith(color: Palette.primary00),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const InputWithText(
                        title: 'Nombre completo',
                        hintText: 'Ingresa tu nombre completo',
                      ),
                      const InputWithText(
                        title: 'Edad',
                        hintText: 'Ingresa tu edad',
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
                      const InputWithText(
                        title: 'Barrio',
                        hintText: 'Selecciona',
                      ),
                      const InputWithText(
                        title: 'Dirección',
                        hintText: 'Ingresa la dirección completa de tu hogar',
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
                      const InputWithText(
                        title: 'Correo electrónico',
                        hintText: 'micorreo@example.com',
                      ),
                      const InputWithText(
                        title: 'Ocupación',
                        hintText: 'Ingresa tu ocupación',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: LargeButton(
                text: 'Continuar',
                onPressed: () =>
                    {context.push(RoutePath.adoptionFamilyData.path)},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
