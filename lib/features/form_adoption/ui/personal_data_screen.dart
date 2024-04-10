import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/form_adoption/ui/family_data_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class PersonalDataScreen extends ConsumerStatefulWidget {
  const PersonalDataScreen({super.key});

  static const path = '/adoption-form-personal-information';

  @override
  ConsumerState<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends ConsumerState<PersonalDataScreen> {
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
          style: FontConstants.subtitle1.copyWith(color: Palette.primary),
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
                            .copyWith(color: Palette.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const InputWithTitle(
                        title: 'Nombre completo',
                        hintText: 'Ingresa tu nombre completo',
                      ),
                      const InputWithTitle(
                        title: 'Edad',
                        hintText: 'Ingresa tu edad',
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 20,
                            child: const InputWithTitle(
                              title: 'Departamento',
                              hintText: 'Selecciona',
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 20,
                            child: const InputWithTitle(
                              title: 'Municipio',
                              hintText: 'Selecciona',
                            ),
                          ),
                        ],
                      ),
                      const InputWithTitle(
                        title: 'Barrio',
                        hintText: 'Selecciona',
                      ),
                      const InputWithTitle(
                        title: 'Dirección',
                        hintText: 'Ingresa la dirección completa de tu hogar',
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 20,
                            child: const InputWithTitle(
                              title: 'Teléfono fijo',
                              hintText: '604 123 4567',
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 20,
                            child: const InputWithTitle(
                              title: 'Celular',
                              hintText: '312 456 6789',
                            ),
                          ),
                        ],
                      ),
                      const InputWithTitle(
                        title: 'Correo electrónico',
                        hintText: 'micorreo@example.com',
                      ),
                      const InputWithTitle(
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
                    ref.read(appRouterProvider).push(FamilyDataScreen.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
