import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class FamilyDataScreen extends ConsumerStatefulWidget {
  const FamilyDataScreen({super.key});

  @override
  ConsumerState<FamilyDataScreen> createState() => _FamilyDataScreenState();
}

class _FamilyDataScreenState extends ConsumerState<FamilyDataScreen> {
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
                        'Composición de la familia',
                        style: FontConstants.subtitle2
                            .copyWith(color: Palette.primary00),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const InputWithText(
                        title: 'Número de personas en el hogar',
                        hintText: 'Ingresa el número de personas en el hogar',
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 20,
                            child: const InputWithText(
                              title: 'Adultos',
                              hintText: 'Ej: 2',
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 20,
                            child: const InputWithText(
                              title: 'Niños',
                              hintText: 'Ej: 2',
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 3) - 20,
                            child: const InputWithText(
                              title: 'Bebés',
                              hintText: 'Ej: 2',
                            ),
                          ),
                        ],
                      ),
                      const InputWithText(
                        title: 'Edad de cada uno',
                        hintText: 'Ingresa la edad de cada persona',
                      ),
                      const InputWithText(
                        title: 'Describa la composición del grupo familiar',
                        hintText: 'Ej: Papá, Mamá, abuela e hijos',
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
                onPressed: () => ref
                    .read(appRouterProvider)
                    .push(RoutePath.adoptionSecondaryData.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
