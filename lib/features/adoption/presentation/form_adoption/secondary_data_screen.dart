import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_first_screen.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class SecondaryDataScreen extends ConsumerStatefulWidget {
  const SecondaryDataScreen({super.key});

  static const path = '/adoption-form-secondary-information';
  @override
  ConsumerState<SecondaryDataScreen> createState() =>
      _SecondaryDataScreenState();
}

class _SecondaryDataScreenState extends ConsumerState<SecondaryDataScreen> {
  String city = '';
  String department = '';
  dynamic allDepartments;
  @override
  void initState() {
    allDepartments = ref.read(locationProvider.notifier).getDepartamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos de contacto adicional diferente a su núcleo familiar',
                  style:
                      FontConstants.subtitle2.copyWith(color: Palette.primary),
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputWithTitle(
                  title: 'Nombre completo',
                  hintText: 'Ingresa el nombre completo',
                ),
                Row(
                  children: [
                    Flexible(
                      child: DropdownSearchInput(
                        onChange: (value) {
                          setState(() {
                            department = value;
                          });
                        },
                        asyncItems: (p0) => allDepartments,
                        title: 'Departamento',
                      ),
                    ),
                    const SizedBox(width: 20),
                    FutureBuilder(
                      future: ciudades,
                      builder: (context, snapshot) {
                        return Flexible(
                          child: DropdownSearchInput(
                            onChange: (value) {
                              setState(() {
                                city = value;
                              });
                            },
                            asyncItems: (p0) => ciudades,
                            title: 'Ciudad',
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const InputWithTitle(
                  title: 'Barrio',
                  hintText: 'Ingresa el barrio',
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
          const Spacer(),
          LargeButton(
            text: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).push(QuestionaryScreen.path),
          ),
        ],
      ),
    );
  }
}
