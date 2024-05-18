// ignore_for_file: avoid_build_context_in_providers, avoid_manual_providers_as_generated_provider_dependency, use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/adoption/data/repository/adoption_repository.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_projection/form_adoption_projection.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_request/form_adoption_request.dart';
import 'package:pet_home/features/adoption/domain/postulation_search_query/postulation_search_query.dart';
import 'package:pet_home/features/adoption/presentation/user_postulation/user_postulation_screen.dart';
import 'package:pet_home/features/home/presentation/home_screen.dart';
import 'package:pet_home/ui/scaffold/scaffold_controller.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

part 'adoption_provider.g.dart';

@riverpod
class AdoptionFormsList extends _$AdoptionFormsList
    with PaginatedDataMixinGeneric<FormAdoptionProjection>
    implements PaginatedNotifier<FormAdoptionProjection> {
  @override
  FutureOr<List<FormAdoptionProjection>> build(
    PostulationSearchQuery? filters,
  ) async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    return await init(
      dataFetcher: PaginatedDataRepository(
        fetcher: ({int page = 1, String? query}) async {
          return ref.watch(adoptionRepositoryProvider).getAdoptionForms(
                filters: filters,
                page: page,
                query: query,
                cancelToken: cancelToken,
              );
        },
        queryFilter: filters.toString(),
      ),
    );
  }

  @override
  Future<void> getNextPage() async {
    state = const AsyncLoading();
    state = AsyncData(await fetchData());
  }

  @override
  Future<void> refresh() async {
    state = const AsyncLoading();
  }
}

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

  Future<void> getFormById({
    required BuildContext context,
    required int formId,
    required String isPending,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog(context);
    final res = await ref
        .read(adoptionRepositoryProvider)
        .getFormById(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop(context);
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Oops! Ha surgido un error',
            content: left.message,
            buttonText: 'Ok',
          ),
      (right) => ref.read(appRouterProvider).pushNamed(
        UserPostulationScreen.path,
        extra: right,
        queryParameters: {'isPending': isPending},
      ),
    );
  }

  Future<void> approveApplication({
    required BuildContext context,
    required int formId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog(context);
    final res = await ref
        .read(adoptionRepositoryProvider)
        .approvePostulation(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop(context);
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Oops! Ha surgido un error',
            content: left.message,
            buttonText: 'Ok',
          ),
      (right) {
        ref.watch(scaffoldControllerProvider.notifier).setPosition(0);
        ref.read(appRouterProvider).goNamed(HomeScreen.path);
      },
    );
  }

  Future<void> declineApplication({
    required BuildContext context,
    required int formId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog(context);
    final res = await ref
        .read(adoptionRepositoryProvider)
        .declinePostulation(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop(context);
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
            buildContext: context,
            title: 'Oops! Ha surgido un error',
            content: left.message,
            buttonText: 'Ok',
          ),
      (right) {
        ref.watch(scaffoldControllerProvider.notifier).setPosition(0);
        ref.read(appRouterProvider).goNamed(HomeScreen.path);
      },
    );
  }
}
