import 'package:pet_home/features/auth/data/repository/auth_repository.dart';
import 'package:pet_home/features/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Future<User> register(RegisterRef ref, {required User user}) {
  final res = ref.watch(authRepositoryProvider).register(user: user);
  if (ref.state.hasError) {
    AsyncError(ref.state.error!, StackTrace.current);
  }
  return res;
}
