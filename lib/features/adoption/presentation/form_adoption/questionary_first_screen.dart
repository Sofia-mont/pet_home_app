import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/validators/text_validators.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_second_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';

class QuestionaryScreen extends ConsumerStatefulWidget {
  const QuestionaryScreen({super.key});

  static const path = '/adoption-form-questionary-1';

  @override
  ConsumerState<QuestionaryScreen> createState() => _QuestionaryScreenState();
}

class _QuestionaryScreenState extends ConsumerState<QuestionaryScreen> {
  String patioCubierto = '';
  String propiaAlquiler = '';
  String permiteMascotas = '';
  String colocarProteccion = '';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Column(
        children: [
          Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cuestionario',
                  style:
                      FontConstants.subtitle2.copyWith(color: Palette.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
                const InputWithTitle(
                  title: '¿Por qué quiere adoptar un animal?',
                  hintText: 'Ingresa tu respuesta...',
                  isMultiline: true,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo de vivienda',
                      style: FontConstants.body2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownSearch<String>(
                      key: widget.key,
                      onChanged: (value) {},
                      autoValidateMode: AutovalidateMode.always,
                      validator: (value) =>
                          TextValidators.textMandatory(value.toString()),
                      items: const ['Casa', 'Apartamento', 'Finca'],
                      popupProps: PopupProps.menu(
                        fit: FlexFit.loose,
                        menuProps: MenuProps(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        itemBuilder: (context, item, isSelected) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            item.toString(),
                            style: FontConstants.body2,
                          ),
                        ),
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelStyle: FontConstants.body2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Selecciona',
                          hintStyle: FontConstants.body2
                              .copyWith(color: Palette.textLight),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                const InputWithTitle(
                  title:
                      '¿Qué lugar de la vivienda estaría destinado al animal?',
                  hintText: 'Ingresa tu respuesta...',
                ),
                CheckboxSelect(
                  title:
                      '¿Su vivienda tiene patio, terraza o jardín? Si es así, ¿es cubierto?',
                  options: const ['Sí', 'No', 'No tiene'],
                  groupValue: patioCubierto,
                ),
                CheckboxSelect(
                  title: '¿La vivienda es propia o de alquiler?',
                  options: const ['Propia', 'Alquiler'],
                  groupValue: propiaAlquiler,
                ),
                CheckboxSelect(
                  title: '¿El reglamento de su vivienda permite mascotas?',
                  options: const ['Sí', 'No'],
                  groupValue: permiteMascotas,
                ),
                CheckboxSelect(
                  title:
                      '¿Está dispuesto a colocar protecciones para prevenir escapes y accidentes?',
                  options: const ['Sí', 'No'],
                  groupValue: colocarProteccion,
                ),
              ],
            ),
          ),
          const Spacer(),
          LargeButton(
            text: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).push(QuestionarySecondScreen.path),
          ),
        ],
      ),
    );
  }
}
