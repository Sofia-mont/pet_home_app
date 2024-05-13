import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_first_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class FamilyDataScreen extends ConsumerStatefulWidget {
  const FamilyDataScreen({super.key});

  static const path = '/adoption-form-family-information';

  @override
  ConsumerState<FamilyDataScreen> createState() => _FamilyDataScreenState();
}

class _FamilyDataScreenState extends ConsumerState<FamilyDataScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Composición de la familia',
                  style:
                      FontConstants.subtitle2.copyWith(color: Palette.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) - 20,
                      child: const InputWithTitle(
                        title: 'Adultos',
                        hintText: 'Ej: 2',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) - 20,
                      child: const InputWithTitle(
                        title: 'Niños',
                        hintText: 'Ej: 2',
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) - 20,
                      child: const InputWithTitle(
                        title: 'Bebés',
                        hintText: 'Ej: 2',
                      ),
                    ),
                  ],
                ),
                const InputWithTitle(
                  title: 'Edad de cada uno',
                  hintText: 'Ingresa la edad de cada persona',
                ),
                const InputWithTitle(
                  title: 'Describa la composición del grupo familiar',
                  hintText: 'Ej: Papá, Mamá, abuela e hijos',
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
