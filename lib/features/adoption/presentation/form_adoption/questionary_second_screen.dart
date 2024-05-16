import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/features/adoption/domain/form_adoption/form_adoption_request/form_adoption_request.dart';
import 'package:pet_home/features/adoption/presentation/form_adoption/adoption_conditions_screen.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/checkbox_select.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';
import 'package:pet_home/ui/widgets/inputs/input_with_title.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

class QuestionarySecondScreenArgs {
  const QuestionarySecondScreenArgs({required this.form, required this.postId});

  final int postId;
  final FormAdoptionRequest form;

  @override
  String toString() =>
      'QuestionarySecondScreenArgs(form: $form, postId: $postId)';
}

class QuestionarySecondScreen extends ConsumerStatefulWidget {
  const QuestionarySecondScreen({
    required this.form,
    required this.postId,
    super.key,
  });

  final int postId;
  final FormAdoptionRequest form;

  static const path = '/adoption-form-questionary-2';

  @override
  ConsumerState<QuestionarySecondScreen> createState() =>
      _QuestionarySecondScreenState();
}

class _QuestionarySecondScreenState
    extends ConsumerState<QuestionarySecondScreen> {
  String esAlergico = '';
  String cubrirEconomia = '';
  final TextEditingController _hoursAloneController = TextEditingController();
  final TextEditingController _hoursFreeController = TextEditingController();
  final TextEditingController _allergycController = TextEditingController();
  final TextEditingController _pregnancyController = TextEditingController();
  final TextEditingController _animalsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Formulario de adopción',
      body: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxSelect(
              title:
                  '¿Tú o algun miembro de la familia es alérgico al pelo de gato o perro?',
              options: const ['Sí', 'No'],
              groupValue: esAlergico,
              onChanged: (value) {
                setState(() {
                  esAlergico = value ?? '';
                });
              },
            ),
            CheckboxSelect(
              title:
                  '¿Puede cubrir económicamente sus necesidades: alimento, cuentas veterinarias, vacunas, correas, juguetes, medicinas, elementos de higiene?',
              options: const ['Sí', 'No'],
              groupValue: cubrirEconomia,
              onChanged: (value) {
                setState(() {
                  cubrirEconomia = value ?? '';
                });
              },
            ),
            InputWithTitle(
              controller: _hoursAloneController,
              title: '¿Cuántas horas del día permanecería solo el animal?',
              hintText: 'Ingresa tu respuesta...',
            ),
            InputWithTitle(
              controller: _hoursFreeController,
              title: '¿Qué tiempo diario dispone para compartir con el animal?',
              hintText: 'Ingresa tu respuesta...',
            ),
            InputWithTitle(
              controller: _allergycController,
              title: '¿Qué sucedería si alguien resultara alérgico al animal?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            InputWithTitle(
              controller: _pregnancyController,
              title:
                  '¿Qué sucedería si usted o, en caso de ser hombre, su pareja quedara embarazada?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            InputWithTitle(
              controller: _animalsController,
              title:
                  '¿Anteriormente ha tenido animales en casa? ¿Cuál (es)? ¿Qué paso con ellos?',
              hintText: 'Ingresa tu respuesta...',
              isMultiline: true,
            ),
            LargeButton(
              text: 'Continuar',
              onPressed: () => _submitHandler(),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateForm() {
    return esAlergico != '' &&
        cubrirEconomia != '' &&
        _hoursAloneController.text.isNotEmpty &&
        _hoursFreeController.text.isNotEmpty &&
        _allergycController.text.isNotEmpty &&
        _pregnancyController.text.isNotEmpty &&
        _animalsController.text.isNotEmpty;
  }

  void _submitHandler() {
    final isValid = _validateForm();
    if (isValid) {
      ref.read(appRouterProvider).push(
            AdoptionConditionsScreen.path,
            extra: AdoptionConditionsScreenArgs(
              form: widget.form.copyWith(
                questionnaire: widget.form.questionnaire?.copyWith(
                  allergic: esAlergico,
                  needsEconomically: cubrirEconomia,
                  hoursAlone: _hoursAloneController.text,
                  availableTime: _hoursFreeController.text,
                  allergyHappened: _allergycController.text,
                  pregnancyHappened: _pregnancyController.text,
                  petsBefore: _animalsController.text,
                ),
              ),
              postId: widget.postId,
            ),
          );
    } else {
      ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Información incompleta',
            content: 'Por favor, ingresa toda la información',
            buttonText: 'Aceptar',
          );
    }
  }
}
