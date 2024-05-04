import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/family_data_screen.dart';
import 'package:pet_home/features/location/data/provider/location_provider.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/dropdown_search_input.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class PersonalDataScreen extends ConsumerStatefulWidget {
  const PersonalDataScreen({super.key});

  static const path = '/adoption-form-personal-information';

  @override
  ConsumerState<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends ConsumerState<PersonalDataScreen> {
  String city = '';
  String department = '';
  dynamic allDepartments;
  @override
  void initState() {
    allDepartments =
        ref.read(locationNotifierProvider.notifier).getDepartamentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ciudades = department == ''
        ? Future.value([])
        : ref.read(locationNotifierProvider.notifier).getCiudades(department);
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Datos del candidato',
                  style:
                      FontConstants.subtitle2.copyWith(color: Palette.primary),
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
                  hintText: 'Ingresa la dirección completa de tu hogar',
                ),
                const InputWithTitle(
                  title: 'Celular',
                  hintText: '312 456 6789',
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
          const Spacer(),
          LargeButton(
            text: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).push(FamilyDataScreen.path),
          ),
        ],
      ),
    );
  }
}
