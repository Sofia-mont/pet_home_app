import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/ui/constants/font_constants.dart';
import 'package:pet_home/ui/constants/palette.dart';
import 'package:pet_home/ui/constants/pethome_icons.dart';
import 'package:pet_home/ui/widgets/buttons/large_button.dart';

import '../../../../core/router/router.dart';

class SuccessFormSentScreen extends ConsumerStatefulWidget {
  const SuccessFormSentScreen({super.key});

  static const path = '/success-form-sent';

  @override
  ConsumerState<SuccessFormSentScreen> createState() =>
      _SuccessFormSentScreenState();
}

class _SuccessFormSentScreenState extends ConsumerState<SuccessFormSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Pethome.pet_love,
                    size: 150.0,
                    color: Palette.primary,
                  ),
                  Text(
                    '¡Tu solicitud de adopción ha sido enviada!',
                    style: FontConstants.subtitle1.copyWith(
                      color: Palette.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Ten en cuenta que el diligenciamiento de este formulario no significa que se te dará el animal en adopción. Tus datos y referencias personales serán evaluados y se tomará una decisión basada en el bienestar del animal. ',
                    style: FontConstants.body2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            LargeButton(
              text: 'Finalizar',
              onPressed: () => {
                popUntil(),
                ref.read(appRouterProvider).pushReplacement(HomeScreen.path),
              },
            ),
          ],
        ),
      ),
    );
  }

  popUntil() {
    while (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
    }
  }
}
