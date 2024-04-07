import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_home/core/extension_methods/future_extension.dart';
import 'package:pet_home/core/router/router.dart';
import 'package:pet_home/core/sealed/either.dart';
import 'package:pet_home/features/auth/data/register/provider/register_state.dart';
import 'package:pet_home/features/auth/data/register/repository/auth_repository.dart';
import 'package:pet_home/features/auth/domain/user.dart';
import 'package:pet_home/features/home/ui/home_screen.dart';
import 'package:pet_home/ui/widgets/modals/custom_modals.dart';

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  RegisterNotifier.fromRef,
);

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({
    required this.ref,
    required this.authRepository,
  }) : super(RegisterState.initial());

  factory RegisterNotifier.fromRef(Ref ref) {
    return RegisterNotifier(
      ref: ref,
      authRepository: ref.read(authRepositoryProvider),
    );
  }

  final AuthRepository authRepository;
  final Ref ref;

  void resetState() => state = RegisterState.initial();

  Future<void> register({
    required User user,
    required BuildContext context,
  }) async {
    final res = await authRepository.register(user: user).toEither();
    res.fold(
      (left) =>
          ref.read(customModalsProvider).showAlertDialog(context: context),
      (right) => ref.read(appRouterProvider).pushNamed(HomeScreen.path),
    );
  }
}
