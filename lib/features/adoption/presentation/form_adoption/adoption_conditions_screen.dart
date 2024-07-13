import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/adoption/data/provider/adoption_provider.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_request.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/icons/pethome_icons.dart';
import 'package:pet_home/ui/scaffold/custom_scaffold.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

class AdoptionConditionsScreenArgs {
  const AdoptionConditionsScreenArgs({
    required this.form,
    required this.postId,
  });

  final int postId;
  final FormAdoptionRequest form;

  @override
  String toString() =>
      'AdoptionConditionsScreenArgs(form: $form, postId: $postId)';
}

class AdoptionConditionsScreen extends ConsumerStatefulWidget {
  const AdoptionConditionsScreen({
    required this.form,
    required this.postId,
    super.key,
  });

  final int postId;
  final FormAdoptionRequest form;

  static const path = '/adoption-conditions';

  @override
  ConsumerState<AdoptionConditionsScreen> createState() =>
      _QuestionaryThirdScreenState();
}

class _QuestionaryThirdScreenState
    extends ConsumerState<AdoptionConditionsScreen> {
  bool termsAndConditions = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: 'Solicitud de adopción',
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Antes de finalizar...',
            style: FontConstants.subtitle1.copyWith(
              color: Palette.primary,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Pethome.paw_filled,
              color: Palette.primary,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Soy consciente de que un animal puede ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'dañar ',
                    style:
                        FontConstants.body1.copyWith(color: Palette.secondary),
                  ),
                  TextSpan(
                    text: 'o ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'morder ',
                    style:
                        FontConstants.body1.copyWith(color: Palette.secondary),
                  ),
                  TextSpan(
                    text: 'mis muebles y/o pertenencias',
                    style: FontConstants.body2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Pethome.paw_filled,
              color: Palette.primary,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Soy consciente que al adoptar un perro/gato debo ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'educarlo ',
                    style:
                        FontConstants.body1.copyWith(color: Palette.secondary),
                  ),
                  TextSpan(
                    text: 'y ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'ser paciente',
                    style: FontConstants.body1.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' mientras este se adapta a la nueva familia y hábitos',
                    style: FontConstants.body2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Pethome.paw_filled,
              color: Palette.primary,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Si la adopción se concreta, estoy de acuerdo con recibir ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'visitas de seguimiento periódicas ',
                    style:
                        FontConstants.body1.copyWith(color: Palette.secondary),
                  ),
                  TextSpan(
                    text:
                        'y enviar fotografías cada vez que se solicite para el respectivo seguimiento',
                    style: FontConstants.body2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Pethome.paw_filled,
              color: Palette.primary,
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Me comprometo a hacer la ',
                    style: FontConstants.body2,
                  ),
                  TextSpan(
                    text: 'esterilización',
                    style: FontConstants.body1
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text:
                        ' apenas cumpla 4 meses en caso de ser hembra y en el caso del macho aproximadamente entre los 6 o 7 meses',
                    style: FontConstants.body2,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Transform.scale(
                scale: 1.16,
                child: Radio<bool>(
                  toggleable: true,
                  value: true,
                  groupValue: termsAndConditions,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                  ),
                  fillColor: const WidgetStatePropertyAll(Palette.primary),
                  onChanged: (value) {
                    setState(() {
                      termsAndConditions = value ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: Text(
                  'Acepto las condiciones y soy consciente de todo lo planteado anteriormente',
                  style: FontConstants.caption2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LargeButton(
            isEnabled: termsAndConditions,
            text: 'Enviar solicitud',
            onPressed: () => handleSubmit(),
          ),
        ],
      ),
    );
  }

  popUntil() {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
  }

  handleSubmit() {
    ref.read(adoptionNotifierProvider.notifier).sendAdoptionForm(
          postId: widget.postId,
          form: widget.form,
        );
  }
}
