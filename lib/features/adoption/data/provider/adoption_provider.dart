// ignore_for_file: avoid_build_context_in_providers
import 'package:flutter/material.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/adoption/data/repository/adoption_repository.dart';
import 'package:pet_home/features/adoption/domain/form_adoption/form_adoption_request/form_adoption_request.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'adoption_provider.g.dart';

@riverpod
class AdoptionNotifier extends _$AdoptionNotifier {
  @override
  void build() {}

  Future<void> sendAdoptionForm({
    required BuildContext context,
    required FormAdoptionRequest form,
    required int postId,
  }) async {
    final res = await ref
        .read(adoptionRepositoryProvider)
        .sendFormAdoption(formAdoptionRequest: form, postId: postId)
        .toEither();

    res.fold(
      (left) => ref
          .read(customModalsProvider)
          .showInformativeScreen(context: context, message: left.message),
      (right) => ref.read(customModalsProvider).showInformativeScreen(
            context: context,
            isError: false,
            title: '¡Hemos publicado tu mascota!',
            message:
                'En cualquier momento podrían llegarte solicitudes de adopción, asegurate de revisar sus formularios con toda la información para determinar si es un candidato apto.',
            buttonMsg: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).goNamed(HomeScreen.path),
          ),
    );
  }
}
