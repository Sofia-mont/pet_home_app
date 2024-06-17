import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/domain/family_composition.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_request.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/questionary_first_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class FamilyDataScreenArgs {
  const FamilyDataScreenArgs({required this.form, required this.postId});

  final int postId;
  final FormAdoptionRequest form;

  @override
  String toString() => 'FamilyDataScreenArgs(form: $form, postId: $postId)';
}

class FamilyDataScreen extends ConsumerStatefulWidget {
  const FamilyDataScreen({required this.form, required this.postId, super.key});

  final int postId;
  final FormAdoptionRequest form;

  static const path = '/adoption-form-family-information';

  @override
  ConsumerState<FamilyDataScreen> createState() => _FamilyDataScreenState();
}

class _FamilyDataScreenState extends ConsumerState<FamilyDataScreen> {
  final TextEditingController _adultsController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _babiesController = TextEditingController();
  final TextEditingController _agesController = TextEditingController();
  final TextEditingController _compositionController = TextEditingController();
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
                      child: InputWithTitle(
                        controller: _adultsController,
                        title: 'Adultos',
                        hintText: 'Ej: 2',
                        inputType: TextInputType.number,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) - 20,
                      child: InputWithTitle(
                        controller: _childrenController,
                        title: 'Niños',
                        hintText: 'Ej: 2',
                        inputType: TextInputType.number,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 3) - 20,
                      child: InputWithTitle(
                        controller: _babiesController,
                        title: 'Bebés',
                        hintText: 'Ej: 2',
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                InputWithTitle(
                  controller: _agesController,
                  title: 'Edad de cada uno',
                  hintText: 'Ingresa la edad de cada persona',
                ),
                InputWithTitle(
                  controller: _compositionController,
                  title: 'Describa la composición del grupo familiar',
                  hintText: 'Ej: Papá, Mamá, abuela e hijos',
                ),
              ],
            ),
          ),
          const Spacer(),
          LargeButton(
            text: 'Continuar',
            onPressed: () => _submitHandler(),
          ),
        ],
      ),
    );
  }

  bool _validateForm() {
    return _adultsController.text.isNotEmpty &&
        _childrenController.text.isNotEmpty &&
        _babiesController.text.isNotEmpty &&
        _agesController.text.isNotEmpty &&
        _compositionController.text.isNotEmpty;
  }

  void _submitHandler() {
    final isValid = _validateForm();
    if (isValid) {
      ref.read(appRouterProvider).push(
            QuestionaryScreen.path,
            extra: QuestionaryScreenArgs(
              form: widget.form.copyWith(
                familyComposition: FamilyComposition(
                  adultsHome: int.parse(_adultsController.text),
                  kidsHome: int.parse(_childrenController.text),
                  babiesHome: int.parse(_babiesController.text),
                  ages: _agesController.text,
                  composition: _compositionController.text,
                ),
              ),
              postId: widget.postId,
            ),
          );
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            title: 'Información incompleta',
            content: 'Por favor, ingresa toda la información',
            buttonText: 'Aceptar',
          );
    }
  }
}
