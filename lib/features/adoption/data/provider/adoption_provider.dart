// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:dio/dio.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/adoption/data/repository/adoption_repository.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_projection.dart';
import 'package:pet_home/features/adoption/domain/form_adoption_request.dart';
import 'package:pet_home/features/adoption/domain/postulation_search_query.dart';
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
    required FormAdoptionRequest form,
    required int postId,
  }) async {
    final res = await ref
        .read(adoptionRepositoryProvider)
        .sendFormAdoption(formAdoptionRequest: form, postId: postId)
        .toEither();

    res.fold(
      (left) => ref.read(customModalsProvider).showInformativeScreen(
            message: left.message,
            onPressed: ref.read(appRouterProvider).pop,
          ),
      (right) => ref.read(customModalsProvider).showInformativeScreen(
            isError: false,
            title: '¡Tu solicitud de adopción ha sido enviada!',
            message:
                'Ten en cuenta que el diligenciamiento de este formulario no significa que se te dará el animal en adopción. Tus datos y referencias personales serán evaluados y se tomará una decisión basada en el bienestar del animal',
            buttonMsg: 'Continuar',
            onPressed: () =>
                ref.read(appRouterProvider).goNamed(HomeScreen.path),
          ),
    );
  }

  Future<void> getFormById({
    required int formId,
    required String isPending,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(adoptionRepositoryProvider)
        .getFormById(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop();
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
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
    required int formId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(adoptionRepositoryProvider)
        .approvePostulation(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop();
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
            title: 'Oops! Ha surgido un error',
            content: left.message,
            buttonText: 'Ok',
            buttonAction: () {
              ref.watch(scaffoldControllerProvider.notifier).setPosition(0);
              ref.read(appRouterProvider).goNamed(HomeScreen.path);
            },
          ),
      (right) {
        ref.watch(scaffoldControllerProvider.notifier).setPosition(0);
        ref.read(appRouterProvider).goNamed(HomeScreen.path);
      },
    );
  }

  Future<void> declineApplication({
    required int formId,
  }) async {
    ref.read(customModalsProvider).showLoadingDialog();
    final res = await ref
        .read(adoptionRepositoryProvider)
        .declinePostulation(formId: formId)
        .toEither();
    ref.read(customModalsProvider).pop();
    res.fold(
      (left) => ref.read(customModalsProvider).showInfoDialog(
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
