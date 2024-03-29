import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/form_adoption/ui/questionary_first_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class SecondaryDataScreen extends ConsumerStatefulWidget {
  const SecondaryDataScreen({super.key});

  static const path = '/adoption-form-secondary-information';
  @override
  ConsumerState<SecondaryDataScreen> createState() =>
      _SecondaryDataScreenState();
}

class _SecondaryDataScreenState extends ConsumerState<SecondaryDataScreen> {
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
                        'Datos de contacto adicional diferente a su núcleo familiar',
                        style: FontConstants.subtitle2
                            .copyWith(color: Palette.primary00),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const InputWithTitle(
                        title: 'Nombre completo',
                        hintText: 'Ingresa el nombre completo',
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
                        hintText: 'Ingresa la dirección completa del hogar',
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
                    ref.read(appRouterProvider).push(QuestionaryScreen.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
